#include <string>
#include <map>
#include <iostream>

#include "docopt.h"

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
        Shell (-w | --write) --udp=<eth_index> --ip=<ip>
        Shell (-w | --write) --udp=<eth_index> --gateway=<gateway>
        Shell (-w | --write) --udp=<eth_index> --netmask=<netmask>
        Shell (-w | --write) --udp=<eth_index> --mac=<mac>
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --ip
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --local_port
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --remote_port
        Shell (-r | --read) --eth=<eth_index> --vxlan=<vxlan_index> --vni
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --ip=<ip>
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --local_port=<port>
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --remote_port=<port>
        Shell (-w | --write) --eth=<eth_index> --vxlan=<vxlan_index> --vni=<vni>
        
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
        --ip=<ip>                   The IP address of the UDP core, or the remote IP address of the VXLAN core. Must be a dot delimited string.
        --gateway                   The gateway of the UDP core.
        --gateway=<gateway>         The gateway of the UDP core. Must be a dot delimited string.
        --netmask                   The netmask of the UDP core.
        --netmask=<gateway>         The netmask of the UDP core. Must be a dot delimited string.
        --mac                       The MAC address of the UDP core.
        --mac=<mac>                 The MAC address of the UDP core. Must be a colon delimited string.
        --local_port                The local port of the VXLAN core.
        --local_port=<port>         The local port of the VXLAN core.
        --remote_port               The remote port of the VXLAN core.
        --remote_port=<port>        The remote port of the VXLAN core.
        --vni                       The VNI of the VXLAN core.
        --vni=<vni>                 The VNI of the VXLAN core.
)";

int main(int argc, char** argv)
{
    std::map<std::string, docopt::value> args = docopt::docopt(USAGE, {argv + 1, argv + argc}, true, "Shell v1.0");

    for (auto const& arg: args)
    {
        std::cout << arg.first << ": " << arg.second << "\n";
    }
}
