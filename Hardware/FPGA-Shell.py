#!/usr/bin/python3

import os
import glob
import xml.etree.ElementTree as et
import subprocess
import multiprocessing

###############################################################################################
######################################### Input/Output ########################################
###############################################################################################
def print_success(string):
    print("\033[1;35;48m[FPGA-Shell]\033[1;37;0m \033[1;32;48m" + string + "\033[1;37;0m")

def print_info(string):
    print("\033[1;35;48m[FPGA-Shell]\033[1;37;0m " + string)

def print_warning(string):
    print("\033[1;35;48m[FPGA-Shell]\033[1;37;0m \033[1;33;48m" + string + "\033[1;37;0m")

def print_error(string):
    print("\033[1;35;48m[FPGA-Shell]\033[1;37;0m \033[1;31;48m" + string + "\033[1;37;0m")

def read_input(string):
    return input("\033[1;35;48m[FPGA-Shell]\033[1;37;0m " + string + ": ")

def read_yesno(string, prefer_yes = False, prefer_no = False):
    if prefer_yes and prefer_no:
        raise ValueError
    prompt = "\033[1;35;48m[FPGA-Shell]\033[1;37;0m " + string
    if (prefer_yes):
        prompt += " (Y/n)? "
    elif (prefer_no):
        prompt += " (y/N)? "
    else:
        prompt += " (y/n)? "
    while True:
        accept = input(prompt)
        if not accept:
            if prefer_yes:
                return True
            elif prefer_no:
                return False
        elif accept == "y" or accept == "Y":
            return True
        elif accept == "n" or accept == "N":
            return False

def read_number(string, lower_limit=None, upper_limit=None):
    prompt = "\033[1;35;48m[FPGA-Shell]\033[1;37;0m " + string
    if lower_limit is not None and upper_limit:
        prompt += " (" + str(lower_limit) + "-" + str(upper_limit) + "): "
    elif lower_limit:
        prompt += " (min: " + str(lower_limit) + "): "
    elif upper_limit:
        prompt += " (max: " + str(upper_limit) + "): "
    else:
        prompt += ": "
    while True:
        number = input(prompt)
        try:
            number = int(number)
            if lower_limit and number < lower_limit:
                continue
            if upper_limit and number > upper_limit:
                continue
            return number
        except ValueError:
            pass

###############################################################################################
##################################### Vivado Installation #####################################
###############################################################################################
while True:
    try:
        var = False
        VIVADO_PATH = os.environ["XILINX_VIVADO"]
        var = True
        print_info("Found environment variable XILINX_VIVADO pointing to: " + VIVADO_PATH)
        accept = read_yesno("Use this path", prefer_yes=True)
        if not accept:
            raise KeyError
    except KeyError:
        if not var:
            print_warning("Environment variable XILINX_VIVADO was not found.")
        VIVADO_PATH = read_input("Enter the path to your vivado installation")
    if not os.path.exists(VIVADO_PATH + "/data/boards/board_files/"):
        print_error("Cannot find board files at: " + VIVADO_PATH + "/data/boards/board_files/. Please make sure you have entered the correct path to vivado")
    else:
        break
BOARDS = []
for folder in glob.glob(VIVADO_PATH + "/data/boards/board_files/**"):
    BOARDS.append(folder.split("/")[-1])
print_success("The following boards where found: ")
for i in range(len(BOARDS)):
    print_info("\t" + str(i) + ".\t" + BOARDS[i])
board = read_number("Enter the board number you'd like to use for creating the shell", 0, len(BOARDS)-1)
versions = glob.glob(VIVADO_PATH + "/data/boards/board_files/" + BOARDS[board] + "/**")
if len(versions) == 1:
    path = versions[0]
    print_success("Board " + BOARDS[board] + " version " + versions[0].split("/")[-1] + " found.")
else:
    print_success("Multiple versions found for board " + BOARDS[board])
    for i in range(len(versions)):
        print_info("\t" + str(i) + ".\t" + versions[i].split("/")[-1])
    version = read_number("Enter the version number you'd like to use for creating the shell", 0, len(versions)-1)
    path = versions[version]

###############################################################################################
################################ Checking Board Compatibility #################################
###############################################################################################
BOARD = None
FPGA = None
HS_ETH = set()
HS_ETH_FQS = {}         # Dict of lists, allowed freqs per interface
HS_ETH_FQ = {}          # Dict, picked freq per interface
HS_ETH_100G_USED = False
VXLAN_100G = []
PCIE = None
DDR4 = []
DDR4_SIZES = []
DIMM = []

root = et.parse(path + "/board.xml").getroot()
BOARD = root.get("vendor") + ":" + root.get("name") + ":"
components = root.find("components")
for component in components:
    if component.get("type") == "fpga":
        FPGA = component.get("part_name")
        BOARD += component.get("name") + ":"
    elif component.get("sub_type") == "sfp":
        modes = component.find("component_modes")
        for mode in modes:
            ips = mode.find("preferred_ips")
            for ip in ips:
                if ip.get("name") == "cmac_usplus":
                    HS_ETH.add(component.get("name"))
                    if component.get("name") not in HS_ETH_FQS:
                        HS_ETH_FQS[component.get("name")] = set()
                    HS_ETH_FQS[component.get("name")].add("100G")
                    HS_ETH_100G_USED = True
                elif ip.get("name") == "xxv_ethernet":
                    HS_ETH.add(component.get("name"))
                    if component.get("name") not in HS_ETH_FQS:
                        HS_ETH_FQS[component.get("name")] = set()
                    HS_ETH_FQS[component.get("name")].add("10G")
                    HS_ETH_FQS[component.get("name")].add("25G")
                elif ip.get("name") == "l_ethernet":
                    HS_ETH.add(component.get("name"))
                    if component.get("name") not in HS_ETH_FQS:
                        HS_ETH_FQS[component.get("name")] = set()
                    HS_ETH_FQS[component.get("name")].add("40G")
                    HS_ETH_FQS[component.get("name")].add("50G")
    elif component.get("sub_type") == "ddr":
        parameters = component.find("parameters")
        for parameter in parameters:
            if parameter.get("name") == "ddr_type" and parameter.get("value") == "ddr4":
                DDR4.append(component.get("name"))
            elif parameter.get("name") == "size":
                DDR4_SIZES.append(parameter.get("value"))
    # elif component.get("sub_type") == "pci":
BOARD += root.find("file_version").text
HS_ETH = list(HS_ETH)
if not FPGA:
    print_error("Could not read FPGA part name from the board file.")
    exit(1)
if not BOARD:
    print_error("Could not read board name from the board file.")
    exit(2)
if not HS_ETH:
    print_error("Board " + BOARDS[board] + " has no high speed ethernet interfaces. Our shell only supports high speed ethernet interfaces for now.")
    exit(3)
if not DDR4:
    print_warning("Board " + BOARDS[board] + " has no DDR4 interfaces.")
if len(DDR4) != len(DDR4_SIZES):
    print_error("Could not correctly read all info about the DDR4 interfaces.")
    exit(4)
print_success("Board info read successfully. " + BOARDS[board] + " board has: ")
print_info("\tBoard Name: " + BOARD)
print_info("\tFPGA Name: " + FPGA)
print_info("\tHigh Speed Ethernet Interfaces: ")
for eth in HS_ETH:
    HS_ETH_FQS[eth] = list(HS_ETH_FQS[eth])
    HS_ETH_FQS[eth].sort(key=lambda x: int(x.split("G")[0]))
    print_info("\t\t" + eth + ": [" + ", ".join(HS_ETH_FQS[eth]) + "]")
print_info("\tDDR4 Interfaces: ")
for iface, size in zip(DDR4, DDR4_SIZES):
    print_info("\t\t" + iface + ": " + size)

###############################################################################################
####################################### Read User Config ######################################
###############################################################################################
for eth in HS_ETH:
    print_success("The following speeds are supported on " + eth + ": ")
    for i in range(len(HS_ETH_FQS[eth])):
        print_info("\t" + str(i) + ".\t" + HS_ETH_FQS[eth][i])
    HS_ETH_FQ[eth] = HS_ETH_FQS[eth][read_number("Enter the speed number you'd like to use", 0, len(HS_ETH_FQS[eth])-1)]
for eth in HS_ETH:
    VXLAN_100G.append(read_number("Enter the number of VXLAN bridges required on " + eth, 1, 8))

###############################################################################################
#################################### Create Vivado Scripts ####################################
###############################################################################################
with open("Parameters.tcl", "w") as script:
    print("set FPGA " + FPGA, file=script)
    print("set BOARD " + BOARD, file=script)
    print("set WORK_DIR " + os.getcwd() + "/", file=script)
    print("set QSFP_COUNT " + str(len(HS_ETH)), file=script)
    print("set QSFP_INTERFACES {", end="", file=script)
    for iface in HS_ETH:
        print(iface, end=" ", file=script)
    print("}", file=script)
    print("set QSFP_SPEEDS {", end="", file=script)
    for iface in HS_ETH:
        print(HS_ETH_FQ[iface], end=" ", file=script)
    print("}", file=script)
    if HS_ETH_100G_USED:
        print("set QSFP_100_USED true", file=script)
    else:
        print("set QSFP_100_USED false", file=script)
    print("set VXLAN_INTERFACES {", end="", file=script)
    for num in VXLAN_100G:
        print(num, end=" ", file=script)
    print("}", file=script)
    print("set DDR4_COUNT " + str(len(DDR4)), file=script)
    print("set DDR4_INTERFACES {", end="", file=script)
    for iface in DDR4:
        print(iface, end=" ", file=script)
    print("}", file=script)
print_success("Generated configuration.")

###############################################################################################
######################################## Prerequisites ########################################
###############################################################################################
with open("IPs/VXLAN-bridge/VXLAN_bridge.tcl", "w") as script:
    print("""open_project vxlan_bridge
set_top vxlan_bridge
add_files vxlan_bridge.cpp
open_solution \"solution1\"
set_part {""" + FPGA + """} -tool vivado
create_clock -period 3 -name default
config_compile
config_export -format ip_catalog -rtl verilog -vivado_phys_opt place -vivado_report_level 0
config_rtl -encoding onehot -reset all -reset_level low
csynth_design
export_design -rtl verilog -format ip_catalog
exit""", file=script)

with open("IPs/AXI-GPIO/AXI_GPIO.tcl", "w") as script:
    print("""open_project gpio
set_top gpio
add_files AXI_GPIO.cpp
open_solution \"solution1\"
set_part {""" + FPGA + """} -tool vivado
create_clock -period 3 -name default
config_compile
config_export -format ip_catalog -rtl verilog -vivado_phys_opt place -vivado_report_level 0
config_rtl -encoding onehot -reset all -reset_level low
csynth_design
export_design -rtl verilog -format ip_catalog
exit""", file=script)
try:
    subprocess.run("git submodule init", shell=True, check=True)
    subprocess.run("git submodule update", shell=True, check=True)
    print_success("Cloned prerequisite IPs.")
except subprocess.SubprocessError as e:
    print_error("Could not clone prerequisite IPs: " + str(e))
    exit(5)
print_info("Building prerequisites.")
try:
    subprocess.run("cd IPs/lbus_axis_converter && make gen_ip -j" + str(multiprocessing.cpu_count()), shell=True, check=True)
    subprocess.run("cd IPs/GULF-Stream && make GULF_Stream_IPCore -j" + str(multiprocessing.cpu_count()), shell=True, check=True)
    subprocess.run("cd IPs/IPLibrary && make AXI4-RAM -j" + str(multiprocessing.cpu_count()), shell=True, check=True)
    subprocess.run("cd IPs/IPLibrary && make AXI4S-Replicator -j" + str(multiprocessing.cpu_count()), shell=True, check=True)
    subprocess.run("cd IPs/VXLAN-bridge && vivado_hls VXLAN_bridge.tcl", shell=True, check=True)
    subprocess.run("cd IPs/AXI-GPIO && vivado_hls AXI_GPIO.tcl", shell=True, check=True)
    print_success("Built prerequisite IPs.")
except subprocess.SubprocessError as e:
    print_error("Could not build prerequisite IPs: " + str(e))
    exit(6)

###############################################################################################
######################################### Build Shell #########################################
###############################################################################################
# try:
#     subprocess.run("vivado -nolog -nojournal -mode batch -source FPGA-Shell.tcl", shell=True, check=True)
# except subprocess.SubprocessError as e:
#     print_error("Could not build shell: " + str(e))
#     exit(7)
