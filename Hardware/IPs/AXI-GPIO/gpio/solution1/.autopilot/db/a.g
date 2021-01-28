#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /work/mewais/projects/FPGA-Shell/Hardware/IPs/AXI-GPIO/gpio/solution1/.autopilot/db/a.g.bc ${1+"$@"}
