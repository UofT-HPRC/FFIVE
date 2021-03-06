#ifndef SHELL_ACCESS_HPP
#define SHELL_ACCESS_HPP

#include <iostream>
#include <string>

#include "ShellSystem.hpp"
#include "ShellUtils.hpp"

namespace FPGA_SHELL
{
    // 1. System ID stuff
    // 1.1. Vendor
    std::string GetShellVendor()
    {
        char* vendor = (char*)(ID_RAM_BASE + ID_RAM_VENDOR_OFFSET);
        std::string str(vendor);
        return str;
    }

    // 1.2. Shell
    std::string GetShellName()
    {
        char* shell = (char*)(ID_RAM_BASE + ID_RAM_SHELL_OFFSET);
        std::string str(shell);
        return str;
    }

    // 1.3. Version
    std::string GetShellVersion()
    {
        uint8_t* major = (uint8_t*)(ID_RAM_BASE + ID_RAM_VERSION_MAJOR_OFFSET);
        uint8_t* minor = (uint8_t*)(ID_RAM_BASE + ID_RAM_VERSION_MINOR_OFFSET);
        uint8_t* patch = (uint8_t*)(ID_RAM_BASE + ID_RAM_VERSION_PATCH_OFFSET);
        std::string version;
        version = std::to_string(*major) + "." + std::to_string(*minor) + "." + std::to_string(*patch);
        return version;
    }

    // 1.4. Number of QSFP interfaces used
    uint8_t GetNumQSFPs()
    {
        uint8_t count = 0;
        for (uint8_t i = 0; i < ID_RAM_QSFPS_COUNT; i++)
        {
            uint32_t* QSFP = (uint32_t*)(ID_RAM_BASE + ID_RAM_QSFPS_OFFSET + (ID_RAM_QSFPS_SPAN * i));
            bool enable = (*QSFP & ID_RAM_QSFPS_ENABLE_MASK) >> ID_RAM_QSFPS_ENABLE_SHIFT;
            if (enable)
            {
                count++;
            }
        }
        return count;
    }

    // 1.5. Speed of each QSFP
    std::string GetQSFPSpeed(const uint8_t index)
    {
        if (index >= ID_RAM_QSFPS_COUNT)
        {
            std::cerr << "ERROR: Cannot have more than " << ID_RAM_QSFPS_COUNT << " QSFPs.\n";
            PrintTrace();
        }
        uint32_t* QSFP = (uint32_t*)(ID_RAM_BASE + ID_RAM_QSFPS_OFFSET + (ID_RAM_QSFPS_SPAN * index));
        bool enable = (*QSFP & ID_RAM_QSFPS_ENABLE_MASK) >> ID_RAM_QSFPS_ENABLE_SHIFT;
        if (!enable)
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint8_t speed_num = (*QSFP & ID_RAM_QSFPS_SPEED_MASK) >> ID_RAM_QSFPS_SPEED_SHIFT;
        std::string speed;
        switch (speed_num)
        {
            case 0:
                speed = "10G";
                break;
            case 1:
                speed = "25G";
                break;
            case 2:
                speed = "40G";
                break;
            case 3:
                speed = "50G";
                break;
            case 4:
                speed = "100G";
                break;
            default:
                std::cerr << "ERROR: Unknow speed for QSFP " << index << ".\n";
                PrintTrace();
        }
        return speed;
    }

    // 1.6. Number of VXLANs per QSFP
    uint8_t GetQSFPVXLANs(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* QSFP = (uint32_t*)(ID_RAM_BASE + ID_RAM_QSFPS_OFFSET + (ID_RAM_QSFPS_SPAN * index));
        uint8_t VXLANs = (*QSFP & ID_RAM_QSFPS_VXLANS_MASK) >> ID_RAM_QSFPS_VXLANS_SHIFT;
        return VXLANs;
    }

    // 2. QSFP Configuration
    void InitQSFP(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* RX = (uint32_t*)(QSFPS_BASE + (QSFPS_SPAN * index) + 0x0014);
        uint32_t* TX = (uint32_t*)(QSFPS_BASE + (QSFPS_SPAN * index) + 0x000C);
        uint32_t* aligned = (uint32_t*)(QSFPS_BASE + (QSFPS_SPAN * index) + 0x0204);
        *RX = 0x01;
        *TX = 0x10;
        while (!(*aligned & 0x10));
        *TX = 0x01;
    }

    // 3. QSFP statistics
    // 3.1. RX Bytes
    // 3.1.1. All RX Bytes
    uint64_t GetQSFPAllRXBytes(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* bytes = (uint64_t*)(QSFPS_BASE + QSFPS_RX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        return *bytes;
    }

    // 3.1.2. Good RX Bytes
    uint64_t GetQSFPGoodRXBytes(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* bytes = (uint64_t*)(QSFPS_BASE + QSFPS_RX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        return *bytes;
    }

    // 3.1.3. Bad RX Bytes
    uint64_t GetQSFPBadRXBytes(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* all = (uint64_t*)(QSFPS_BASE + QSFPS_RX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        uint64_t* good = (uint64_t*)(QSFPS_BASE + QSFPS_RX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        return *all - *good;
    }

    // 3.2. TX Bytes
    // 3.2.1. All TX Bytes
    uint64_t GetQSFPAllTXBytes(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* bytes = (uint64_t*)(QSFPS_BASE + QSFPS_TX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        return *bytes;
    }

    // 3.2.2. Good TX Bytes
    uint64_t GetQSFPGoodTXBytes(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* bytes = (uint64_t*)(QSFPS_BASE + QSFPS_TX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        return *bytes;
    }

    // 3.2.3. Bad TX Bytes
    uint64_t GetQSFPBadTXBytes(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* all = (uint64_t*)(QSFPS_BASE + QSFPS_TX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        uint64_t* good = (uint64_t*)(QSFPS_BASE + QSFPS_TX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        return *all - *good;
    }

    // 3.3. RX Packets
    // 3.3.1. All RX Packets
    uint64_t GetQSFPAllRXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_RX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.3.2. Good RX Packets
    uint64_t GetQSFPGoodRXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_RX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.3.3. Bad RX Packets
    uint64_t GetQSFPBadRXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* all = (uint64_t*)(QSFPS_BASE + QSFPS_RX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        uint64_t* good = (uint64_t*)(QSFPS_BASE + QSFPS_RX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *all - *good;
    }

    // 3.3.4. Unicast RX Packets
    uint64_t GetQSFPUnicastRXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_RX_UNICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.3.5. Multicast RX Packets
    uint64_t GetQSFPMulticastRXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_RX_MULTICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.3.6. Broadcast RX Packets
    uint64_t GetQSFPBroadcastRXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_RX_BROADCAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.4. TX Packets
    // 3.4.1. All TX Packets
    uint64_t GetQSFPAllTXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_TX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.4.2. Good TX Packets
    uint64_t GetQSFPGoodTXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_TX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.4.3. Bad TX Packets
    uint64_t GetQSFPBadTXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* all = (uint64_t*)(QSFPS_BASE + QSFPS_TX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        uint64_t* good = (uint64_t*)(QSFPS_BASE + QSFPS_TX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *all - *good;
    }

    // 3.4.4. Unicast TX Packets
    uint64_t GetQSFPUnicastTXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_TX_UNICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.4.5. Multicast TX Packets
    uint64_t GetQSFPMulticastTXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_TX_MULTICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.4.6. Broadcast TX Packets
    uint64_t GetQSFPBroadcastTXPackets(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint64_t* packets = (uint64_t*)(QSFPS_BASE + QSFPS_TX_BROADCAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        return *packets;
    }

    // 3.5. RX Packet Size Histogram
    // TODO
    // 3.6. RX Packet Size Histogram
    // TODO
    
    // 4. UDP COnfiguration
    // 4.1. Set IP Address
    void SetGulfStreamIP(const uint8_t index, const uint32_t IP)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_IP_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = IP;
    }

    // 4.2. Get IP Address
    uint32_t GetGulfStreamIP(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_IP_OFFSET + (GULFSTREAMS_SPAN * index));
        return *config;
    }

    // 4.3. Set Gateway
    void SetGulfStreamGateway(const uint8_t index, const uint32_t IP)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_GATEWAY_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = IP;
    }

    // 4.4. Get Gateway
    uint32_t GetGulfStreamGateway(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_GATEWAY_OFFSET + (GULFSTREAMS_SPAN * index));
        return *config;
    }

    // 4.5. Set Netmask
    void SetGulfStreamNetmask(const uint8_t index, const uint32_t IP)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_NETMASK_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = IP;
    }

    // 4.6. Get Netmask
    uint32_t GetGulfStreamNetmask(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_NETMASK_OFFSET + (GULFSTREAMS_SPAN * index));
        return *config;
    }

    // 4.7. Set MAC
    void SetGulfStreamMAC(const uint8_t index, const uint64_t MAC)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config_high = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_MAC_HIGH_OFFSET + (GULFSTREAMS_SPAN * index));
        uint32_t* config_low = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_MAC_LOW_OFFSET + (GULFSTREAMS_SPAN * index));
        // least significant bit of most significant byte in mac address must end is 0'b10 to indicate it is locally assigned unicast
        *config_high = ((MAC >> 32) & 0xFCFF) | 0x200;
        *config_low = MAC & 0xFFFFFFFF;
    }

    // 4.8. Get MAC
    uint64_t GetGulfStreamMAC(const uint8_t index)
    {
        uint64_t MAC;
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config_high = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_MAC_HIGH_OFFSET + (GULFSTREAMS_SPAN * index));
        uint32_t* config_low = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_MAC_LOW_OFFSET + (GULFSTREAMS_SPAN * index));
        MAC = *config_high;
        MAC <<= 32;
        MAC |= *config_low;
        return MAC;
    }

    // 4.9. Enable GulfStream
    void EnableGulfStream(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_ENABLE_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = 1;
    }

    // 4.10. Disable GulfStream
    void DisableGulfStream(const uint8_t index)
    {
        if (index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(GULFSTREAMS_BASE + GULFSTREAMS_ENABLE_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = 0;
    }

    // 5. VXLAN Configuration
    // 5.1. Set Remote IP
    void SetVXLANRemoteIP(const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t IP)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_IP_OFFSET);
        *config = IP;
    }

    // 5.2. Get Remote IP
    uint32_t GetVXLANRemoteIP(const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_IP_OFFSET);
        return *config;
    }

    // 5.3. Set Local Port
    void SetVXLANLocalPort(const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t port)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_LOCAL_PORT_OFFSET);
        *config = port;
    }

    // 5.4. Get Local Port
    uint32_t GetVXLANLocalPort(const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_LOCAL_PORT_OFFSET);
        return *config;
    }

    // 5.5. Set Local Port
    void SetVXLANRemotePort(const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t port)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_REMOTE_PORT_OFFSET);
        *config = port;
    }

    // 5.6. Get Local Port
    uint32_t GetVXLANRemotePort(const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_REMOTE_PORT_OFFSET);
        return *config;
    }

    // 5.7. Set Local Port
    void SetVXLANVNI(const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t VNI)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_VNI_OFFSET);
        *config = VNI;
    }

    // 5.8. Get Local Port
    uint32_t GetVXLANVNI(const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        if (QSFP_index >= GetNumQSFPs())
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        uint32_t* config = (uint32_t*)(QSFPS_VXLANS_BASE + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_VNI_OFFSET);
        return *config;
    }
}

#endif // SHELL_ACCESS_HPP
