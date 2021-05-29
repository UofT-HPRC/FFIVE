#include <string>
#include <map>
#include <iostream>

#include "docopt.h"
#include "ShellParameters.hpp"
#include "ShellAccess.hpp"
#include "ShellUtils.hpp"
#include "ShellMMap.hpp"

const std::string USAGE = 
R"(VNF Shell Config.
A simple program to configure our 100G VNF Shell.

    Usage:
        Shell (-h | --help)
        Shell (-c | --clock)
        Shell (-i | --init)
        Shell (-r | --read) --info
        Shell (-r | --read) --eth_count
        Shell (-r | --read) --eth=<eth_index> --speed
        Shell (-r | --read) --eth=<eth_index> --vxlans
        Shell (-r | --read) --eth=<eth_index> --stats
        Shell (-r | --read) --udp=<eth_index> --ip
        Shell (-r | --read) --udp=<eth_index> --gateway
        Shell (-r | --read) --udp=<eth_index> --netmask
        Shell (-r | --read) --udp=<eth_index> --mac
        Shell (-w | --write) --udp=<eth_index> --ip <ip>
        Shell (-w | --write) --udp=<eth_index> --gateway <gateway>
        Shell (-w | --write) --udp=<eth_index> --netmask <netmask>
        Shell (-w | --write) --udp=<eth_index> --mac <mac>
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --ip
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --local_port
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --remote_port
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --vni
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --ip <ip>
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --local_port <port>
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --remote_port <port>
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --vni <vni>

    Options:
        -h --help                   Show this help message.
        -c --clock                  Configure the PL clock generators.
        -i --init                   Initialize the system. Must have already written the necessary configuration first.
        -r --read                   Read values.
        -w --write                  Configure values.
        --info                      Shell information, including vnedor, name, and version.
        --eth_count                 Number of high speed Ethernet interfaces on the shell.
        --eth=<eth_index>           The index of the target Ethernet interface to read/configure. Starts at 0.
        --udp=<eth_index>           The index of the UDP interface to read/configure. Starts at 0.
        --vxlan=<vxlan_index>       The index of the VXLAN interface on its corresponding Ethernet interface.
        --ip                        The IP address of the UDP core, or the remote IP address of the VXLAN core.
        --gateway                   The gateway of the UDP core.
        --netmask                   The netmask of the UDP core.
        --mac                       The MAC address of the UDP core.
        --local_port                The local port of the VXLAN core.
        --remote_port               The remote port of the VXLAN core.
        --vni                       The VNI of the VXLAN core.
)";

int main(int argc, char** argv)
{
    std::map<std::string, docopt::value> args = docopt::docopt(USAGE, {argv + 1, argv + argc}, true, "Shell v1.0");
    
    int32_t fd = -1;
    fd = FPGA_SHELL::OpenPhysical(fd);

    if (args["--info"].asBool())
    {
        std::cout << "Vendor: " << FPGA_SHELL::GetShellVendor(fd) << "\n";
        std::cout << "Name: " << FPGA_SHELL::GetShellName(fd) << "\n";
        std::cout << "Version: " << FPGA_SHELL::GetShellVersion(fd) << "\n";
    }
    else if (args["--clock"].asBool())
    {
        FPGA_SHELL::ConfigureClocks(fd, USER_CLOCK_DIV0, USER_CLOCK_DIV1);
    }
    else if (args["--init"].asBool())
    {
        uint32_t count = FPGA_SHELL::GetNumQSFPs(fd);
        for (uint32_t i = 0; i < count; i++)
        {
            FPGA_SHELL::InitQSFP(fd, i);
            FPGA_SHELL::EnableGulfStream(fd, i);
        }
    }
    else if (args["--eth_count"].asBool())
    {
        std::cout << FPGA_SHELL::GetNumQSFPs(fd) << "\n";
    }
    else if (args["--eth"] && !args["--vxlan"])
    {
        uint8_t eth = std::stoi(args["--eth"].asString());
        if (args["--speed"].asBool())
        {
            std::cout << FPGA_SHELL::GetQSFPSpeed(fd, eth) << "\n";
        }
        else if (args["--vxlans"].asBool())
        {
            std::cout << FPGA_SHELL::GetQSFPVXLANs(fd, eth) << "\n";
        }
        else if (args["--stats"].asBool())
        {
            std::cout << "ETH" << eth << " All RX Bytes: " << FPGA_SHELL::GetQSFPAllRXBytes(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Good RX Bytes: " << FPGA_SHELL::GetQSFPGoodRXBytes(fd, eth) << "\n";
            std::cout << "ETH" << eth << " All TX Bytes: " << FPGA_SHELL::GetQSFPAllTXBytes(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Good TX Bytes: " << FPGA_SHELL::GetQSFPGoodTXBytes(fd, eth) << "\n";

            std::cout << "ETH" << eth << " All RX Packets: " << FPGA_SHELL::GetQSFPAllRXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Good RX Packets: " << FPGA_SHELL::GetQSFPGoodRXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Unicast RX Packets: " << FPGA_SHELL::GetQSFPUnicastRXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Multicast RX Packets: " << FPGA_SHELL::GetQSFPMulticastRXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Broadcast RX Packets: " << FPGA_SHELL::GetQSFPBroadcastRXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " All TX Packets: " << FPGA_SHELL::GetQSFPAllTXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Good TX Packets: " << FPGA_SHELL::GetQSFPGoodTXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Unicast TX Packets: " << FPGA_SHELL::GetQSFPUnicastTXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Multicast TX Packets: " << FPGA_SHELL::GetQSFPMulticastTXPackets(fd, eth) << "\n";
            std::cout << "ETH" << eth << " Broadcast TX Packets: " << FPGA_SHELL::GetQSFPBroadcastTXPackets(fd, eth) << "\n";
        }
    }
    else if (args["--udp"] && args["--read"].asBool())
    {
        uint8_t udp = std::stoi(args["--udp"].asString());
        if (args["--ip"].asBool())
        {
            std::cout << FPGA_SHELL::IntToIP(FPGA_SHELL::GetGulfStreamIP(fd, udp)) << "\n";
        }
        else if (args["--gateway"].asBool())
        {
            std::cout << FPGA_SHELL::IntToIP(FPGA_SHELL::GetGulfStreamGateway(fd, udp)) << "\n";
        }
        else if (args["--netmask"].asBool())
        {
            std::cout << FPGA_SHELL::IntToIP(FPGA_SHELL::GetGulfStreamNetmask(fd, udp)) << "\n";
        }
        else if (args["--mac"].asBool())
        {
            std::cout << FPGA_SHELL::IntToMAC(FPGA_SHELL::GetGulfStreamMAC(fd, udp)) << "\n";
        }
    }
    else if (args["--udp"] && args["--write"].asBool())
    {
        uint8_t udp = std::stoi(args["--udp"].asString());
        if (args["--ip"].asBool())
        {
            uint32_t IP = FPGA_SHELL::IPToInt(args["<ip>"].asString());
            FPGA_SHELL::SetGulfStreamIP(fd, udp, IP);
        }
        else if (args["--gateway"].asBool())
        {
            uint32_t gateway = FPGA_SHELL::IPToInt(args["<gateway>"].asString());
            FPGA_SHELL::SetGulfStreamGateway(fd, udp, gateway);
        }
        else if (args["--netmask"].asBool())
        {
            uint32_t netmask = FPGA_SHELL::IPToInt(args["<netmask>"].asString());
            FPGA_SHELL::SetGulfStreamNetmask(fd, udp, netmask);
        }
        else if (args["--mac"].asBool())
        {
            uint64_t MAC = FPGA_SHELL::MACToInt(args["<mac>"].asString());
            FPGA_SHELL::SetGulfStreamMAC(fd, udp, MAC);
        }
    }
    else if (args["--eth"] && args["--vxlan"] && args["--read"].asBool())
    {
        uint8_t eth = std::stoi(args["--eth"].asString());
        uint8_t vxlan = std::stoi(args["--vxlan"].asString());
        if (args["--ip"].asBool())
        {
            std::cout << FPGA_SHELL::IntToIP(FPGA_SHELL::GetVXLANRemoteIP(fd, eth, vxlan)) << "\n";
        }
        else if (args["--local_port"].asBool())
        {
            std::cout << FPGA_SHELL::GetVXLANLocalPort(fd, eth, vxlan) << "\n";
        }
        else if (args["--remote_port"].asBool())
        {
            std::cout << FPGA_SHELL::GetVXLANRemotePort(fd, eth, vxlan) << "\n";
        }
        else if (args["--vni"].asBool())
        {
            std::cout << FPGA_SHELL::GetVXLANVNI(fd, eth, vxlan) << "\n";
        }
    }
    else if (args["--eth"] && args["--vxlan"] && args["--write"].asBool())
    {
        uint8_t eth = std::stoi(args["--eth"].asString());
        uint8_t vxlan = std::stoi(args["--vxlan"].asString());
        if (args["--ip"].asBool())
        {
            uint32_t IP = FPGA_SHELL::IPToInt(args["<ip>"].asString());
            FPGA_SHELL::SetVXLANRemoteIP(fd, eth, vxlan, IP);
        }
        else if (args["--local_port"].asBool())
        {
            uint32_t port = std::stoi(args["<port>"].asString());
            FPGA_SHELL::SetVXLANLocalPort(fd, eth, vxlan, port);
        }
        else if (args["--remote_port"].asBool())
        {
            uint32_t port = std::stoi(args["<port>"].asString());
            FPGA_SHELL::SetVXLANRemotePort(fd, eth, vxlan, port);
        }
        else if (args["--vni"].asBool())
        {
            uint32_t VNI = std::stoi(args["<vni>"].asString());
            FPGA_SHELL::SetVXLANVNI(fd, eth, vxlan, VNI);
        }
    }
    else
    {
        std::cerr << "Unknown command arguments.\n";
        for (const auto& arg: args)
        {
            std::cout << arg.first << ":\t\t" << arg.second.isBool() << ", " << arg.second.isLong() << ", " << arg.second.isString() << ", " << arg.second.isStringList() << ", " << arg.second << "\n";
        }
        FPGA_SHELL::PrintTrace();
    }

    FPGA_SHELL::ClosePhysical(fd);
    return 0;
}
