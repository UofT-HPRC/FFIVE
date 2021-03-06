#include <string>
#include <map>
#include <iostream>

#include "docopt.h"
#include "ShellAccess.hpp"
#include "ShellUtils.hpp"

const std::string USAGE = 
R"(VNF Shell Config.
A simple program to configure our 100G VNF Shell.

    Usage:
        Shell (-h | --help)
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

    if (args["--info"])
    {
        std::cout << "Vendor: " << FPGA_SHELL::GetShellVendor() << "\n";
        std::cout << "Name: " << FPGA_SHELL::GetShellName() << "\n";
        std::cout << "Version: " << FPGA_SHELL::GetShellVersion() << "\n";
    }
    else if (args["--eth_count"])
    {
        std::cout << "ETH Count: " << FPGA_SHELL::GetNumQSFPs() << "\n";
    }
    else if (args["--eth"] && !args["--vxlan"])
    {
        uint8_t eth = std::stoi(args["--eth"].asString());
        if (args["--speed"])
        {
            std::cout << "ETH" << eth << " Speed: " << FPGA_SHELL::GetQSFPSpeed(eth) << "\n";
        }
        else if (args["--vxlans"])
        {
            std::cout << "ETH" << eth << " VXLAN Count: " << FPGA_SHELL::GetQSFPVXLANs(eth) << "\n";
        }
        else if (args["--stats"])
        {
            std::cout << "ETH" << eth << " All RX Bytes: " << FPGA_SHELL::GetQSFPAllRXBytes(eth) << "\n";
            std::cout << "ETH" << eth << " Good RX Bytes: " << FPGA_SHELL::GetQSFPGoodRXBytes(eth) << "\n";
            std::cout << "ETH" << eth << " All TX Bytes: " << FPGA_SHELL::GetQSFPAllTXBytes(eth) << "\n";
            std::cout << "ETH" << eth << " Good TX Bytes: " << FPGA_SHELL::GetQSFPGoodTXBytes(eth) << "\n";

            std::cout << "ETH" << eth << " All RX Packets: " << FPGA_SHELL::GetQSFPAllRXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Good RX Packets: " << FPGA_SHELL::GetQSFPGoodRXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Unicast RX Packets: " << FPGA_SHELL::GetQSFPUnicastRXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Multicast RX Packets: " << FPGA_SHELL::GetQSFPMulticastRXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Broadcast RX Packets: " << FPGA_SHELL::GetQSFPBroadcastRXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " All TX Packets: " << FPGA_SHELL::GetQSFPAllTXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Good TX Packets: " << FPGA_SHELL::GetQSFPGoodTXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Unicast TX Packets: " << FPGA_SHELL::GetQSFPUnicastTXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Multicast TX Packets: " << FPGA_SHELL::GetQSFPMulticastTXPackets(eth) << "\n";
            std::cout << "ETH" << eth << " Broadcast TX Packets: " << FPGA_SHELL::GetQSFPBroadcastTXPackets(eth) << "\n";
        }
    }
    else if (args["--udp"] && args["--read"])
    {
        uint8_t udp = std::stoi(args["--udp"].asString());
        if (args["--ip"])
        {
            std::cout << "UDP" << udp << " IP: " << FPGA_SHELL::IntToIP(FPGA_SHELL::GetGulfStreamIP(udp)) << "\n";
        }
        else if (args["--gateway"])
        {
            std::cout << "UDP" << udp << " Gateway: " << FPGA_SHELL::IntToIP(FPGA_SHELL::GetGulfStreamGateway(udp)) << "\n";
        }
        else if (args["--netmask"])
        {
            std::cout << "UDP" << udp << " Netmask: " << FPGA_SHELL::IntToIP(FPGA_SHELL::GetGulfStreamNetmask(udp)) << "\n";
        }
        else if (args["--mac"])
        {
            std::cout << "UDP" << udp << " MAC: " << FPGA_SHELL::IntToMAC(FPGA_SHELL::GetGulfStreamMAC(udp)) << "\n";
        }
    }
    else if (args["-udp"] && args["--write"])
    {
        uint8_t udp = std::stoi(args["--udp"].asString());
        if (args["--ip"])
        {
            uint32_t IP = FPGA_SHELL::IPToInt(args["<ip>"].asString());
            FPGA_SHELL::SetGulfStreamIP(udp, IP);
        }
        else if (args["--gateway"])
        {
            uint32_t gateway = FPGA_SHELL::IPToInt(args["<gateway>"].asString());
            FPGA_SHELL::SetGulfStreamGateway(udp, gateway);
        }
        else if (args["--netmask"])
        {
            uint32_t netmask = FPGA_SHELL::IPToInt(args["<netmask>"].asString());
            FPGA_SHELL::SetGulfStreamNetmask(udp, netmask);
        }
        else if (args["--mac"])
        {
            uint64_t MAC = FPGA_SHELL::MACToInt(args["<mac>"].asString());
            FPGA_SHELL::SetGulfStreamMAC(udp, MAC);
        }
    }
    else if (args["--eth"] && args["--vxlan"] && args["--read"])
    {
        uint8_t eth = std::stoi(args["--eth"].asString());
        uint8_t vxlan = std::stoi(args["--vxlan"].asString());
        if (args["--ip"])
        {
            std::cout << "ETH" << eth << "-VXLAN" << vxlan << " IP: " << FPGA_SHELL::IntToIP(FPGA_SHELL::GetVXLANRemoteIP(eth, vxlan)) << "\n";
        }
        else if (args["--local_port"])
        {
            std::cout << "ETH" << eth << "-VXLAN" << vxlan << " Local Port: " << FPGA_SHELL::GetVXLANLocalPort(eth, vxlan) << "\n";
        }
        else if (args["--remote_port"])
        {
            std::cout << "ETH" << eth << "-VXLAN" << vxlan << " Remote Port: " << FPGA_SHELL::GetVXLANRemotePort(eth, vxlan) << "\n";
        }
        else if (args["--VNI"])
        {
            std::cout << "ETH" << eth << "-VXLAN" << vxlan << " VNI: " << FPGA_SHELL::GetVXLANVNI(eth, vxlan) << "\n";
        }
    }
    else if (args["--eth"] && args["--vxlan"] && args["--write"])
    {
        uint8_t eth = std::stoi(args["--eth"].asString());
        uint8_t vxlan = std::stoi(args["--vxlan"].asString());
        if (args["--ip"])
        {
            uint32_t IP = FPGA_SHELL::IPToInt(args["<ip>"].asString());
            FPGA_SHELL::SetVXLANRemoteIP(eth, vxlan, IP);
        }
        else if (args["--local_port"])
        {
            uint32_t port = std::stoi(args["<port>"].asString());
            FPGA_SHELL::SetVXLANLocalPort(eth, vxlan, port);
        }
        else if (args["--remote_port"])
        {
            uint32_t port = std::stoi(args["<port>"].asString());
            FPGA_SHELL::SetVXLANRemotePort(eth, vxlan, port);
        }
        else if (args["--VNI"])
        {
            uint32_t VNI = std::stoi(args["<vni>"].asString());
            FPGA_SHELL::SetVXLANVNI(eth, vxlan, VNI);
        }
    }
    else
    {
        std::cerr << "Unknown command arguments.\n";
        for (const auto& arg: args)
        {
            std::cout << arg.first << "\t" << arg.second << "\n";
        }
        FPGA_SHELL::PrintTrace();
    }
}
