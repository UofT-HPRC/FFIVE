ARM_G++ := aarch64-linux-gnu-g++
X86_G++ := g++

HEADERS := $(wildcard Software/*.hpp)
SOURCES := Software/Shell.cpp

Software/Shell: $(SOURCES) $(HEADERS)
	$(ARM_G++) -Wall -std=c++11 $< -ISoftware/docopt.cpp/ -LSoftware/docopt.cpp/ -l:libdocopt.a -o $@

Software/docopt.cpp/libdocopt.a:
	cd Software/docopt.cpp/ && cmake . && make
