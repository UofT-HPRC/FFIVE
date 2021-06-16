SHELL := /bin/bash
G++ := aarch64-linux-gnu-g++

SHELL_HEADERS := $(wildcard Software/Shell*.hpp)
SHELL_SOURCES := Software/Shell.cpp

USER_HEADERS := $(wildcard Software/User*.hpp)
USER_SOURCES := Software/User.cpp

Container: Software Hardware
	read -p "Enter image name (for example: user/image): " name && \
	read -p "Enter image tag (for example: latest): " tag && \
	docker build -t $$name:$$tag . && \
	docker push $$name:$$tag

Clean: Software/Clean Hardware/Clean

Software: Software/User Software/Shell

Software/User: $(USER_SOURCES) $(USER_HEADERS) Software/docopt.cpp/libdocopt.a
	$(G++) -Wall -std=c++11 $< -ISoftware/docopt.cpp/ -LSoftware/docopt.cpp/build/ -l:libdocopt.a -o $@

Software/Shell: $(SHELL_SOURCES) $(SHELL_HEADERS) Software/docopt.cpp/libdocopt.a
	$(G++) -Wall -std=c++11 $< -ISoftware/docopt.cpp/ -LSoftware/docopt.cpp/build/ -l:libdocopt.a -o $@

Software/docopt.cpp/libdocopt.a:
	cp Software/toolchain.cmake Software/docopt.cpp/toolchain.cmake && cd Software/docopt.cpp/ && mkdir -p build/ && cd build/ && cmake ../ -DCMAKE_TOOLCHAIN_FILE=./toolchain.cmake && make

Software/Clean:
	rm -rf Software/Shell Software/User
	rm -rf Software/docopt.cpp/toolchain.cmake
	rm -rf Software/docopt.cpp/build/

Hardware: Hardware/Shell Hardware/User

Hardware/User: Hardware/FPGA_Shell/FPGA_Shell.runs/impl_1/FPGA_Shell_wrapper.bit

Hardware/Shell: Hardware/FPGA_Shell/FPGA_Shell.xpr

Hardware/FPGA_Shell/FPGA_Shell.xpr:
	cd Hardware/ && python3 FPGA-Shell.py
	@echo "Shell is now created, create your design and build your bitstream."

Hardware/FPGA_Shell/FPGA_Shell.runs/impl_1/FPGA_Shell_wrapper.bit:
	@read -p "Bitstream will now be created, have you created your VNF yet (Y/n)? " FFIVE_VNF && if [[ $${FFIVE_VNF} -eq "y" || $${FFIVE_VNF} -eq "Y" || -z $${FFIVE_VNF} ]]; then cd Hardware && vivado -nolog -nojournal -mode batch -source FPGA-Build.tcl; else echo "Build your VNF then remake" && return -1; fi

Hardware/Clean:
	rm -rf Hardware/*.log Hardware/*.jou
	rm -rf Hardware/FPGA_Shell/ -rf
	rm -rf Hardware/Parameters.tcl
	git submodule foreach --recursive git reset --hard
