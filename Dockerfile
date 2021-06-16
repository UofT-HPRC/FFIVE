FROM arm64v8/ubuntu:18.04

WORKDIR /work
COPY Software/Shell .
COPY Software/User .
COPY Software/ShellAPI.py .
COPY Software/UserAPI.py .
COPY Hardware/FPGA_Shell/FPGA_Shell.runs/impl_1/FPGA_Shell_wrapper.bit .

RUN apt -y update
RUN apt install -y python3.8
RUN apt install -y python3-flask
RUN ./prereqs.sh

CMD cp /work/FPGA_Shell_wrapper.bit /lib/firmware/FFIVE.bit && echo FFIVE.bit > /sys/class/fpga_manager/fpga0/firmware && python3.8 UserAPI.py
