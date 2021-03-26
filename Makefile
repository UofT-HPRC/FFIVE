G++ := aarch64-linux-gnu-g++

HEADERS := $(wildcard Software/*.hpp)
SOURCES := Software/Shell.cpp

Software/Shell: $(SOURCES) $(HEADERS) Software/docopt.cpp/libdocopt.a
	$(G++) -Wall -std=c++11 $< -ISoftware/docopt.cpp/ -LSoftware/docopt.cpp/ -l:libdocopt.a -o $@

Software/docopt.cpp/libdocopt.a:
	cp Software/toolchain.cmake Software/docopt.cpp/toolchain.cmake && cd Software/docopt.cpp/ && cmake . -DCMAKE_TOOLCHAIN_FILE=./toolchain.cmake && make
