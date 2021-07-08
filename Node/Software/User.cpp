#include "docopt.h"
#include "UserAccess.hpp"
#include "ShellMMap.hpp"

// ADD YOUR OPTIONS BELOW
const std::string USAGE = 
R"(User VNF Config.
A simple program to configure our VNF.

    Usage:
        VNF (-h | --help)

    Options:
        -h --help                   Show this help message.
)";

int main(int argc, char** argv)
{
    std::map<std::string, docopt::value> args = docopt::docopt(USAGE, {argv + 1, argv + argc}, true, "VNF v1.0");
    
    int32_t fd = -1;
    fd = FPGA_SHELL::OpenPhysical(fd);

    // HANDLE YOUR OPTIONS AND CONFIGS HERE

    FPGA_SHELL::ClosePhysical(fd);
    return 0;
}
