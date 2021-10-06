
# 100G-FFIVE: A framework for VNFs in FPGAs

- [Summary](#summary)
- [Usage](#usage)
  * [Node level](#node-level)
    + [Node level hardware](#node-level-hardware)
    + [Node level software](#node-level-software)
    + [Both](#both)
  * [Cloud level](#cloud-level)
- [Dependencies](#dependencies)
  * [Software Dependencies](#software-dependencies)
  * [Source Code Dependencies](#source-code-dependencies)
- [Publications](#publications)
  * [Citations](#citations)
- [Contributors](#contributors)
- [License](#license)

# Summary
This is the repository for the FFIVE framework, a framework for creating 100Gbps FPGA-based VNFs. The repository includes the following:
1. TCL scripts to create the FPGA Shell required for FFIVE.
2. TCL scripts to create some example VNFs.
3. C++ programs for controlling and configuring the FPGA Shell.
4. Python-based RESTful API to remotely configure the FPGA Shell.
5. Base C++ and Python programs to configure the User VNF.
6. A Python-based datacenter-level SDN controller to deploy CPU or FPGA-based VNFs.

# Usage
## Node level
### Node level hardware
This is the hardware of our VNF shell itself, it includes all the necessary components, which are:
- The ARM core of the MPSoC, and its AXI connection to the FPGA.
- A DDR4 interface.
- One or more 100G Ethernet interfaces.
- A configurable number of VXLAN bridges on each of the network interfaces.

To use and build the hardware part, do the following:
1. Run `make Hardware/Shell`.
2. Pick the board you want to use.
3. Pick the speed you want to use for each of the QSFP interfaces.
4. Enter the required number of VXLANs you want on each Ethernet interface.
5. Select the frequency of extra clocks.
6. The Makefile will create a vivado project, open the project and add your VNF.
7. Run `make Hardware/User`, this will build the Vivado project all the way to a bitstream.

### Node level software
This is the software part of the VNF shell, it includes the C++ files to talk to and configure the hardware, as well as the python files that implement the RESTful API.

To use and build do the following:
1. Modify the `User*.hpp` files and `User.cpp` file similarly to their `Shell.cpp` and `Shell*.hpp` files. Add the required addresses, memory maps, and program options for your VNF.
2. Modify the `UserAPI.py` file similarly to `ShellAPI.py`. Add the required REST routes.
3. If your software requires external libraries or extra files, you may need to modify the Makefile and/or Dockerfile.
4. Run `make Software`. This will cross compile the binaries for ARM64.

### Both
Run `make Container`. It will query you for the image name and tag. This will copy the hardware bitstream and the software binaries into the docker container. It will set up the container to program the FPGA and run the API once it is running. And finally, it will push the image to your docker hub repo.

## Cloud level
1. Use the `Config.yaml` file to build the hierarchy of your VNFs.
2. Run `make` to build the docker container.
3. Your Kubernetes cluster must be running a device plugin that advertises FPGAs. We use the following plugin: https://github.com/mewais/FPGA-K8s-DevicePlugin
4. Use the `Deploy.yaml` to deploy the controller on your kubernetes cluster. The controller will take care of deploying your VNFs and configuring them.

# Dependencies
## Software Dependencies
These are dependencies you need to have installed before using the framework.
1. Vivado 2020.2 and 2018.3 (Due to bugs in Vivado 2018.3 and 2019.X, our work was split to using vivado_hls from 2018.3, and vivado from 2020.2)
2. Docker
3. Git
4. GCC/G++
5. Docker
6. Kubernetes

## Source Code Dependencies
These dependencies are already included in the code, you do not need to install any of them.

1. [docopt.cpp](https://github.com/docopt/docopt.cpp)
2. [IPLibrary](https://github.com/mewais/IPLibrary)
3. [GULF-Stream](https://github.com/QianfengClarkShen/GULF-Stream)
4. [FPGA-BPF](https://github.com/UofT-HPRC/fpga-bpf)
5. The repo also includes a firewall example which is based on the [FFShark paper](http://www.fccm.org/proceedings/2020/pdfs/FCCM2020-65FOvhMqzyMYm99lfeVKyl/580300a047/580300a047.pdf)

# Publications
If you use FFIVE in your research, we ask that you cite the following papers:

1. **FFIVE: An FPGA Framework for Interactive VNF Environments**  
   _Juan Camilo Vega, Mohammad Ewais, Alberto Leon-Garcia, Paul Chow_  
   _2021 IEEE International Symposium On Field-Programmable Custom Computing Machines (FCCM 2021)_  
2. **A Framework Integrating FPGAs in VNF Networks**  
   _Mohammad Ewais, Juan Camilo Vega, Alberto Leon-Garcia, Paul Chow_  
   _2021 12th International Conference on Network of the Future (NoF 2021)_  
   **NOTE:** This paper was accepted but has not been made available yet

## Citations
```
@inproceedings{vega2021ffive,
  title={FFIVE: An FPGA Framework for Interactive VNF Environments},
  author={Vega, Juan Camilo and Ewais, Mohammad and Garcia, Alberto Leon and Chow, Paul},
  booktitle={2021 IEEE 29th Annual International Symposium on Field-Programmable Custom Computing Machines (FCCM)},
  pages={263--263},
  year={2021},
  organization={IEEE}
}
@INPROCEEDINGS{Vega2110:Framework,
  author="Mohammad Ewais and Juan Camilo Vega and Alberto Leon-Garcia and Paul Chow",
  title="A Framework Integrating {FPGAs} in {VNF} Networks",
  booktitle="2021 12th International Conference on Network of the Future (NoF) (NoF 2021)",
  address="University of Coimbra, Portugal",
  days=5,
  month=oct,
  year=2021,
}
```

# Contributors
- [Mohammad Ewais](https://mohammad.ewais.ca), University of Toronto
- [Juan Camilo Vega](https://github.com/Juancamilovega), University of Toronto

# License
FFIVE is licensed under the Academic Public License. For more information, check the [LICENSE](https://github.com/UofT-HPRC/FFIVE/blob/master/LICENSE) file.
