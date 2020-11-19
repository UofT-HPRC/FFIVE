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
    if lower_limit and upper_limit:
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
ETH_100G = []
ETH_100G_INTERFACES = []
ETH_100G_CLOCKS = []
VXLAN_100G = []
PCIE = None
DDR4 = []
DIMM = []

root = et.parse(path + "/board.xml").getroot()
BOARD = root.get("vendor") + ":" + root.get("name") + ":"
components = root.find("components")
for component in components:
    if component.get("type") == "fpga":
        FPGA = component.get("part_name")
        BOARD += component.get("name") + ":"
    if component.get("sub_type") == "sfp":
        modes = component.find("component_modes")
        for mode in modes:
            ips = mode.find("preferred_ips")
            for ip in ips:
                if ip.get("name") == "cmac_usplus":
                    ETH_100G.append(component.get("name"))
                    interfaces = mode.find("interfaces")
                    for iface in interfaces:
                        if iface.get("optional") == "true":
                            ETH_100G_CLOCKS.append(iface.get("name"))
                        else:
                            ETH_100G_INTERFACES.append(iface.get("name"))
    # elif component.get("sub_type") == "ddr":
    # elif component.get("sub_type") == "pci":
BOARD += root.find("file_version").text
if not FPGA:
    print_error("Could not read FPGA part name from the board file.")
    exit(1)
if not BOARD:
    print_error("Could not read board name from the board file.")
    exit(2)
if not ETH_100G:
    print_error("Board " + BOARDS[board] + " has no 100G interfaces. Our shell only supports 100G interfaces for now.")
    exit(3)
if len(ETH_100G) != len(ETH_100G_INTERFACES) or len(ETH_100G) != len(ETH_100G_CLOCKS):
    print_error("Could not correctly read all info about the 100G interfaces.")
    exit(4)
print_success("Board info read successfully. " + BOARDS[board] + " board has: ")
print_info("\tBoard Name: " + BOARD)
print_info("\tFPGA Name: " + FPGA)
print_info("\t100G Ethernet Interfaces: ")
for eth in ETH_100G:
    print_info("\t\t" + eth)
for eth in ETH_100G:
    VXLAN_100G.append(read_number("Enter the number of VXLAN bridges required on " + eth))
    # VXLAN_100G.append(read_number("Enter the number of VXLAN bridges required on " + eth), 0, Something)

###############################################################################################
#################################### Create Vivado Scripts ####################################
###############################################################################################
with open("Parameters.tcl", "w") as script:
    print("set FPGA " + FPGA, file=script)
    print("set BOARD " + BOARD, file=script)
    print("set WORK_DIR " + os.getcwd() + "/Hardware/", file=script)
    print("set QSFP_COUNT " + str(len(ETH_100G)), file=script)
    print("set QSFP_INTERFACES {", end="", file=script)
    for iface in ETH_100G_INTERFACES:
        print(iface, end=" ", file=script)
    print("}", file=script)
    print("set QSFP_CLOCKS {", end="", file=script)
    for iface in ETH_100G_CLOCKS:
        print(iface, end=" ", file=script)
    print("}", file=script)
print_success("Generated configuration.")

###############################################################################################
######################################## Prerequisites ########################################
###############################################################################################
try:
    subprocess.run("git submodule init", shell=True, check=True)
    subprocess.run("git submodule update", shell=True, check=True)
    print_success("Cloned prerequisite IPs.")
except subprocess.SubprocessError as e:
    print_error("Could not clone prerequisite IPs: " + e)
    exit(5)
print_info("Building prerequisites.")
try:
    subprocess.run("cd Hardware/IPs/lbus_axis_converter && make gen_ip -j" + str(multiprocessing.cpu_count()), shell=True, check=True)
    subprocess.run("cd Hardware/IPs/GULF-Stream && make GULF_Stream_IPCore -j" + str(multiprocessing.cpu_count()), shell=True, check=True)
    print_success("Built prerequisite IPs.")
except subprocess.SubprocessError as e:
    print_error("Could not build prerequisite IPs: " + e)
    exit(6)
