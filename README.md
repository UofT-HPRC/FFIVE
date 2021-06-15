# 100G-FFIVE: A framework for VNFs in FPGAs

## Node level
### Node level hardware
This is the hardware of our VNF shell itself, it includes all the necessary components, which are:
- The ARM core of the MPSoC, and its AXI connection to the FPGA
- A DDR4 interface.
- Two 100G Ethernet interfaces.
- A configurable number of VXLAN bridges on each of the network interfaces.

To use and build the hardware part, do the following:
1. Run `make hardware_base`.
2. Enter the required number of VXLANs you want on each Ethernet interface.
3. Select the frequency of extra clocks.
4. The makefile will create a vivado project, open the project and add your VNF.
5. Run `make hardware`, this will build the vivado project all the way to a bitstream.

### Node level software
This is the software part of the VNF shell, it includes the C++ files to talk to and configure the hardware, as well as the python files that implement the RESTful API.

To use and build do the following:
1. Modify the `user_config.cpp` file similarly to `ffive_config.cpp`. Add the required addresses, memory maps, and program options.
2. Modify the `user_api.py` file similarly to `ffive_api.py`. Add the required REST routes.
3. Any libraries you used or added that may require installation must be handled in the `prereqs.sh` file.
4. Run `make software`. This will cross compile the binaries for ARM64.

### Both
Run `make image`. It will query you for the image name and tag. This will copy the hardware bitstream and the software binaries into the docker container. It will use the commands from `prereqs.sh` to install all the prerequisites inside the container. It will set up the container to program the FPGA and run the API once it is running. And finally, it will push the image to your docker hub repo.

## Cloud level
1. Use the `config.yaml` file to build the hierarchy of your VNFs.
2. Run `make` to build the docker image of the container.
3. Use the `deploy.yaml` to deploy the controller on your kubernetes cluster. The controller will take care of deploying your VNFs and configuring them.

## Dependencies
1. Vivado 2018.3
2. GCC
