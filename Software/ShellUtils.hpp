#ifndef SHELL_UTILS_HPP
#define SHELL_UTILS_HPP

#include <string>
#include <vector>
#include <execinfo.h>
#include <stdexcept>
#include <iostream>
#include <cstdlib>

namespace FPGA_SHELL
{
    std::vector<std::string> SplitString(const std::string& whole_string, const char delimiter)
    {
        std::vector<std::string> tokens;
        std::string::size_type begin = 0;
        for (std::string::size_type end = 0; (end = whole_string.find(delimiter, end)) != std::string::npos; ++end)
        {
            tokens.push_back(whole_string.substr(begin, end - begin));
            begin = end + 1;
        }

        tokens.push_back(whole_string.substr(begin));
        return tokens;
    }

    uint32_t IPToHex(const std::string& IP_string)
    {
        std::vector<std::string> tokens = SplitString(IP_string, '.');
        uint32_t IP = 0;
        for (std::string& token: tokens)
        {
            IP = IP << 8;
            try
            {
                IP += std::stoi(token);
            }
            catch (std::invalid_argument const &e)
            {
                std::cerr << "Bad input: std::invalid_argument thrown" << '\n';
            }
            catch (std::out_of_range const &e)
            {
                std::cerr << "Integer overflow: std::out_of_range thrown" << '\n';
            }
        }
        return IP;
    }

    void PrintTrace()
    {
        void* stack[100];
        char** desc;
        size_t size = backtrace(stack, 100);
        desc = backtrace_symbols(stack, size);
        std::cerr << "Stack Trace:\n\n";
        for (uint8_t i = 0; i < size; i++)
        {
            std::cerr << "\t" << desc[i] << "\n";
        }
        exit(-1);
    }
}

#endif // SHELL_UTILS_HPP
