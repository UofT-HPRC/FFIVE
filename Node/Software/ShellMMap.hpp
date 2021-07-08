#ifndef SHELL_MMAP_HPP
#define SHELL_MMAP_HPP

#include <iostream>
#include <cstdint>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#include "ShellUtils.hpp"

namespace FPGA_SHELL
{
    // Open /dev/mem, if not already done, to give access to physical addresses
    int32_t OpenPhysical(int32_t fd)
    {
        if (fd == -1)
        {
            if ((fd = open( "/dev/mem", O_RDWR | O_SYNC)) == -1)
            {
                std::cout << "ERROR: Could not open \"/dev/mem\".\n";
                PrintTrace();
            }
        }
        return fd;
    }

    // Close /dev/mem to give access to physical addresses
    void ClosePhysical(int32_t fd)
    {
        close (fd);
    }

    // Establish a virtual address mapping for the physical addresses starting at base, and
    // extending by span bytes.
    void* MapPhysical(int32_t fd, uint64_t base, uint32_t span)
    {
        void *virtual_base;

        // Get a mapping from physical addresses to virtual addresses
        virtual_base = mmap (NULL, span, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, base);
        if (virtual_base == MAP_FAILED)
        {
            std::cout << "ERROR: mmap() failed.\n";
            close (fd);
            PrintTrace();
        }
        return virtual_base;
    }

    // Close the previously-opened virtual address mapping
    int32_t UnmapPhysical(volatile void * virtual_base, uint32_t span)
    {
        if (munmap ((void *) virtual_base, span) != 0)
        {
            std::cout << "ERROR: munmap() failed.\n";
            PrintTrace();
        }
        return 0;
    }
}

#endif // SHELL_MMAP_HPP
