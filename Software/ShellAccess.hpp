#ifndef SHELL_ACCESS_HPP
#define SHELL_ACCESS_HPP

#include <cstdint>
#include <iostream>
#include <string>

#include "ShellSystem.hpp"
#include "ShellUtils.hpp"
#include "ShellMMap.hpp"

namespace FPGA_SHELL
{
    // 0. FPGA Clocks
    void ConfigureClocks(const int32_t fd, const uint8_t div0, const uint8_t div1)
    {
        // References:
        // 1. https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
        // 2. https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html#crl_apb___pl1_ref_ctrl.html
        volatile char* CLOCKS_base = (volatile char*)MapPhysical(fd, CLOCKS_BASE, CLOCKS_SPAN);
        volatile uint32_t* CLOCK0 = (volatile uint32_t*)(CLOCKS_base + CLOCKS_CLOCK0_OFFSET);
        volatile uint32_t* CLOCK1 = (volatile uint32_t*)(CLOCKS_base + CLOCKS_CLOCK1_OFFSET);
        volatile uint32_t* CLOCK2 = (volatile uint32_t*)(CLOCKS_base + CLOCKS_CLOCK2_OFFSET);
        volatile uint32_t* CLOCK3 = (volatile uint32_t*)(CLOCKS_base + CLOCKS_CLOCK3_OFFSET);
        // Clock 0 is 100MHz, divisors are 8, 1
        *CLOCK0 = (8 << 8) |                    // Div 0
                  (1 << 16) |                   // Div 1
                  2 |                           // PLL
                  (1 << 24);                    // Enable
        // Clock 1 is 266MHz, divisors are 4, 1
        *CLOCK1 = (4 << 8) |                    // Div 0
                  (1 << 16) |                   // Div 1
                  2 |                           // PLL
                  (1 << 24);                    // Enable
        // Clock 2 is 266MHz, divisors are 4, 1
        *CLOCK2 = (4 << 8) |                    // Div 0
                  (1 << 16) |                   // Div 1
                  2 |                           // PLL
                  (1 << 24);                    // Enable
        // Clock 3 is design time configurable, divisors are div0 and div1
        *CLOCK3 = (div0 << 8) |                    // Div 0
                  (div1 << 16) |                   // Div 1
                  2 |                           // PLL
                  (1 << 24);                    // Enable
    }

    // 1. System ID stuff
    // 1.1. Vendor
    std::string GetShellVendor(const int32_t fd)
    {
        volatile char* ID_RAM_base = (volatile char*)MapPhysical(fd, ID_RAM_BASE, ID_RAM_SPAN);
        volatile char* vendor = (volatile char*)(ID_RAM_base + ID_RAM_VENDOR_OFFSET);
        std::string str = "";
        for (; *vendor != '\0'; vendor++)
        {
            str += *vendor;
        }
        UnmapPhysical(ID_RAM_base, ID_RAM_SPAN);
        return str;
    }

    // 1.2. Shell
    std::string GetShellName(const int32_t fd)
    {
        volatile char* ID_RAM_base = (volatile char*)MapPhysical(fd, ID_RAM_BASE, ID_RAM_SPAN);
        volatile char* shell = (volatile char*)(ID_RAM_base + ID_RAM_SHELL_OFFSET);
        std::string str = "";
        for (; *shell != '\0'; shell++)
        {
            str += *shell;
        }
        UnmapPhysical(ID_RAM_base, ID_RAM_SPAN);
        return str;
    }

    // 1.3. Version
    std::string GetShellVersion(const int32_t fd)
    {
        volatile char* ID_RAM_base = (volatile char*)MapPhysical(fd, ID_RAM_BASE, ID_RAM_SPAN);
        volatile uint8_t* major = (volatile uint8_t*)(ID_RAM_base + ID_RAM_VERSION_MAJOR_OFFSET);
        volatile uint8_t* minor = (volatile uint8_t*)(ID_RAM_base + ID_RAM_VERSION_MINOR_OFFSET);
        volatile uint8_t* patch = (volatile uint8_t*)(ID_RAM_base + ID_RAM_VERSION_PATCH_OFFSET);
        std::string version;
        version = std::to_string(*major) + "." + std::to_string(*minor) + "." + std::to_string(*patch);
        UnmapPhysical(ID_RAM_base, ID_RAM_SPAN);
        return version;
    }

    // 1.4. Number of QSFP interfaces used
    uint32_t GetNumQSFPs(const int32_t fd)
    {
        volatile char* ID_RAM_base = (volatile char*)MapPhysical(fd, ID_RAM_BASE, ID_RAM_SPAN);
        uint32_t count = 0;
        for (uint8_t i = 0; i < ID_RAM_QSFPS_COUNT; i++)
        {
            volatile uint32_t* QSFP = (volatile uint32_t*)(ID_RAM_base + ID_RAM_QSFPS_OFFSET + (ID_RAM_QSFPS_SPAN * i));
            bool enable = (*QSFP & ID_RAM_QSFPS_ENABLE_MASK) >> ID_RAM_QSFPS_ENABLE_SHIFT;
            if (enable)
            {
                count++;
            }
        }
        UnmapPhysical(ID_RAM_base, ID_RAM_SPAN);
        return count;
    }

    // 1.5. Speed of each QSFP
    std::string GetQSFPSpeed(const int32_t fd, const uint8_t index)
    {
        if (index >= ID_RAM_QSFPS_COUNT)
        {
            std::cerr << "ERROR: Cannot have more than " << ID_RAM_QSFPS_COUNT << " QSFPs.\n";
            PrintTrace();
        }
        volatile char* ID_RAM_base = (volatile char*)MapPhysical(fd, ID_RAM_BASE, ID_RAM_SPAN);
        volatile uint32_t* QSFP = (volatile uint32_t*)(ID_RAM_base + ID_RAM_QSFPS_OFFSET + (ID_RAM_QSFPS_SPAN * index));
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
        UnmapPhysical(ID_RAM_base, ID_RAM_SPAN);
        return speed;
    }

    // 1.6. Number of VXLANs per QSFP
    uint32_t GetQSFPVXLANs(const int32_t fd, const uint8_t index)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* ID_RAM_base = (volatile char*)MapPhysical(fd, ID_RAM_BASE, ID_RAM_SPAN);
        volatile uint32_t* QSFP = (volatile uint32_t*)(ID_RAM_base + ID_RAM_QSFPS_OFFSET + (ID_RAM_QSFPS_SPAN * index));
        uint32_t VXLANs = (*QSFP & ID_RAM_QSFPS_VXLANS_MASK) >> ID_RAM_QSFPS_VXLANS_SHIFT;
        UnmapPhysical(ID_RAM_base, ID_RAM_SPAN);
        return VXLANs;
    }

    // 2. QSFP Configuration
    void InitQSFP(const int32_t fd, const uint8_t index)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* RX = (volatile uint32_t*)(QSFPS_base + (QSFPS_SPAN * index) + 0x0014);
        volatile uint32_t* TX = (volatile uint32_t*)(QSFPS_base + (QSFPS_SPAN * index) + 0x000C);
        volatile uint32_t* aligned = (volatile uint32_t*)(QSFPS_base + (QSFPS_SPAN * index) + 0x0204);
        *RX = 0x01;
        *TX = 0x10;
        while (!(*aligned & 0x2));
        *TX = 0x01;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 3. QSFP statistics
    // 3.1. RX Bytes
    // 3.1.1. All RX Bytes
    uint64_t GetQSFPAllRXBytes(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* bytes = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        result = *bytes;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.1.2. Good RX Bytes
    uint64_t GetQSFPGoodRXBytes(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* bytes = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        result = *bytes;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.1.3. Bad RX Bytes
    uint64_t GetQSFPBadRXBytes(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* all = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        volatile uint64_t* good = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        result = *all - *good;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.2. TX Bytes
    // 3.2.1. All TX Bytes
    uint64_t GetQSFPAllTXBytes(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* bytes = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        result = *bytes;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.2.2. Good TX Bytes
    uint64_t GetQSFPGoodTXBytes(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* bytes = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        result = *bytes;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.2.3. Bad TX Bytes
    uint64_t GetQSFPBadTXBytes(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* all = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_ALL_BYTES_OFFSET + (QSFPS_SPAN * index));
        volatile uint64_t* good = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_GOOD_BYTES_OFFSET + (QSFPS_SPAN * index));
        result = *all - *good;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.3. RX Packets
    // 3.3.1. All RX Packets
    uint64_t GetQSFPAllRXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.3.2. Good RX Packets
    uint64_t GetQSFPGoodRXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.3.3. Bad RX Packets
    uint64_t GetQSFPBadRXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* all = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        volatile uint64_t* good = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *all - *good;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.3.4. Unicast RX Packets
    uint64_t GetQSFPUnicastRXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_UNICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.3.5. Multicast RX Packets
    uint64_t GetQSFPMulticastRXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_MULTICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.3.6. Broadcast RX Packets
    uint64_t GetQSFPBroadcastRXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_RX_BROADCAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.4. TX Packets
    // 3.4.1. All TX Packets
    uint64_t GetQSFPAllTXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.4.2. Good TX Packets
    uint64_t GetQSFPGoodTXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.4.3. Bad TX Packets
    uint64_t GetQSFPBadTXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* all = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_ALL_PACKETS_OFFSET + (QSFPS_SPAN * index));
        volatile uint64_t* good = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_GOOD_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *all - *good;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.4.4. Unicast TX Packets
    uint64_t GetQSFPUnicastTXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_UNICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.4.5. Multicast TX Packets
    uint64_t GetQSFPMulticastTXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_MULTICAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.4.6. Broadcast TX Packets
    uint64_t GetQSFPBroadcastTXPackets(const int32_t fd, const uint8_t index)
    {
        uint64_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_base = (volatile char*)MapPhysical(fd, QSFPS_BASE, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint64_t* packets = (volatile uint64_t*)(QSFPS_base + QSFPS_TX_BROADCAST_PACKETS_OFFSET + (QSFPS_SPAN * index));
        result = *packets;
        UnmapPhysical(QSFPS_base, QSFPS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 3.5. RX Packet Size Histogram
    // TODO
    // 3.6. RX Packet Size Histogram
    // TODO
    
    // 4. UDP COnfiguration
    // 4.1. Set IP Address
    void SetGulfStreamIP(const int32_t fd, const uint8_t index, const uint32_t IP)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_IP_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = IP;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 4.2. Get IP Address
    uint32_t GetGulfStreamIP(const int32_t fd, const uint8_t index)
    {
        uint32_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_IP_OFFSET + (GULFSTREAMS_SPAN * index));
        result = *config;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 4.3. Set Gateway
    void SetGulfStreamGateway(const int32_t fd, const uint8_t index, const uint32_t IP)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_GATEWAY_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = IP;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 4.4. Get Gateway
    uint32_t GetGulfStreamGateway(const int32_t fd, const uint8_t index)
    {
        uint32_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_GATEWAY_OFFSET + (GULFSTREAMS_SPAN * index));
        result = *config;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 4.5. Set Netmask
    void SetGulfStreamNetmask(const int32_t fd, const uint8_t index, const uint32_t IP)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_NETMASK_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = IP;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 4.6. Get Netmask
    uint32_t GetGulfStreamNetmask(const int32_t fd, const uint8_t index)
    {
        uint32_t result;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_NETMASK_OFFSET + (GULFSTREAMS_SPAN * index));
        result = *config;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 4.7. Set MAC
    void SetGulfStreamMAC(const int32_t fd, const uint8_t index, const uint64_t MAC)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config_high = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_MAC_HIGH_OFFSET + (GULFSTREAMS_SPAN * index));
        volatile uint32_t* config_low = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_MAC_LOW_OFFSET + (GULFSTREAMS_SPAN * index));
        // least significant bit of most significant byte in mac address must end is 0'b10 to indicate it is locally assigned unicast
        *config_high = ((MAC >> 32) & 0xFCFF) | 0x200;
        *config_low = MAC & 0xFFFFFFFF;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 4.8. Get MAC
    uint64_t GetGulfStreamMAC(const int32_t fd, const uint8_t index)
    {
        uint64_t MAC;
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config_high = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_MAC_HIGH_OFFSET + (GULFSTREAMS_SPAN * index));
        volatile uint32_t* config_low = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_MAC_LOW_OFFSET + (GULFSTREAMS_SPAN * index));
        MAC = *config_high;
        MAC <<= 32;
        MAC |= *config_low;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        return MAC;
    }

    // 4.9. Enable GulfStream
    void EnableGulfStream(const int32_t fd, const uint8_t index)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_ENABLE_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = 1;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 4.10. Disable GulfStream
    void DisableGulfStream(const int32_t fd, const uint8_t index)
    {
        if (index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* GULFSTREAMS_base = (volatile char*)MapPhysical(fd, GULFSTREAMS_BASE, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(GULFSTREAMS_base + GULFSTREAMS_ENABLE_OFFSET + (GULFSTREAMS_SPAN * index));
        *config = 0;
        UnmapPhysical(GULFSTREAMS_base, GULFSTREAMS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 5. VXLAN Configuration
    // 5.1. Set Remote IP
    void SetVXLANRemoteIP(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t IP)
    {
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_IP_OFFSET);
        *config = IP;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 5.2. Get Remote IP
    uint32_t GetVXLANRemoteIP(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        uint32_t result;
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_IP_OFFSET);
        result = *config;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 5.3. Set Local Port
    void SetVXLANLocalPort(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t port)
    {
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_LOCAL_PORT_OFFSET);
        *config = port;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 5.4. Get Local Port
    uint32_t GetVXLANLocalPort(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        uint32_t result;
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_LOCAL_PORT_OFFSET);
        result = *config;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 5.5. Set Remote Port
    void SetVXLANRemotePort(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t port)
    {
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_REMOTE_PORT_OFFSET);
        *config = port;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 5.6. Get Remote Port
    uint32_t GetVXLANRemotePort(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        uint32_t result;
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_REMOTE_PORT_OFFSET);
        result = *config;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }

    // 5.7. Set VNI
    void SetVXLANVNI(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index, const uint32_t VNI)
    {
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_VNI_OFFSET);
        *config = VNI;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
    }

    // 5.8. Get VNI
    uint32_t GetVXLANVNI(const int32_t fd, const uint8_t QSFP_index, const uint8_t VXLAN_index)
    {
        uint32_t result;
        if (QSFP_index >= GetNumQSFPs(fd))
        {
            std::cerr << "ERROR: QSFP " << QSFP_index << " is not enabled.\n";
            PrintTrace();
        }
        if (VXLAN_index >= GetQSFPVXLANs(fd, QSFP_index))
        {
            std::cerr << "ERROR: VXLAN " << VXLAN_index << " is not enabled.\n";
            PrintTrace();
        }
        volatile char* QSFPS_VXLANS_base = (volatile char*)MapPhysical(fd, QSFPS_VXLANS_BASE, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        volatile uint32_t* config = (volatile uint32_t*)(QSFPS_VXLANS_base + (QSFP_index * QSFPS_VXLANS_SPAN) + (VXLAN_index * VXLANS_SPAN) + VXLANS_VNI_OFFSET);
        result = *config;
        UnmapPhysical(QSFPS_VXLANS_base, QSFPS_VXLANS_SPAN * ID_RAM_QSFPS_COUNT);
        return result;
    }
}

#endif // SHELL_ACCESS_HPP
