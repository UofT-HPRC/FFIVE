FROM uofthprc/python-flask:arm64v8

WORKDIR /work
COPY Software/Shell .
COPY Software/User .
COPY Software/ShellAPI.py .
COPY Software/UserAPI.py .
COPY Hardware/FPGA_Shell/FPGA_Shell.runs/impl_1/FPGA_Shell_wrapper.bit .

CMD cp /work/FPGA_Shell_wrapper.bit /lib/firmware/FFIVE.bit && ./Shell -c && echo FFIVE.bit > /sys/class/fpga_manager/fpga0/firmware && python3.8 UserAPI.py
