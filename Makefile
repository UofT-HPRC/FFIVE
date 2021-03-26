G++ := aarch64-linux-gnu-g++

SHELL_HEADERS := $(wildcard Software/Shell*.hpp)
SHELL_SOURCES := Software/Shell.cpp

USER_HEADERS := $(wildcard Software/User*.hpp)
USER_SOURCES := Software/User.cpp

Software: Software/User Software/Shell

Software/User: $(USER_SOURCES) $(USER_HEADERS) Software/docopt.cpp/libdocopt.a
	$(G++) -Wall -std=c++11 $< -ISoftware/docopt.cpp/ -LSoftware/docopt.cpp/ -l:libdocopt.a -o $@

Software/Shell: $(SHELL_SOURCES) $(SHELL_HEADERS) Software/docopt.cpp/libdocopt.a
	$(G++) -Wall -std=c++11 $< -ISoftware/docopt.cpp/ -LSoftware/docopt.cpp/ -l:libdocopt.a -o $@

Software/docopt.cpp/libdocopt.a:
	cp Software/toolchain.cmake Software/docopt.cpp/toolchain.cmake && cd Software/docopt.cpp/ && cmake . -DCMAKE_TOOLCHAIN_FILE=./toolchain.cmake && make
