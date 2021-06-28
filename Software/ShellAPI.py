#/bin/python3.8

import flask
import os
import sys
import shutil
import subprocess

app = flask.Blueprint('ShellAPI', __name__)

CONFIG_FILE = './Shell'

# Helper functions
# 1. Read info
def read_info():
    program_string = CONFIG_FILE
    program_string += ' -r --info'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading shell info failed')
        print(e)
        return None, e

# 2. Read ETH count
def read_ETH_count():
    program_string = CONFIG_FILE
    program_string += ' -r --eth_count'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading shell ethernet count failed')
        print(e)
        return None, e

# 3. Read ETH speed
def read_ETH_speed(eth):
    program_string = CONFIG_FILE
    program_string += ' -r --eth ' + str(eth) + ' --speed'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading ETH' + str(eth) + ' speed failed')
        print(e)
        return None, e

# 4. Read VXLAN count
def read_VXLAN_count(eth):
    program_string = CONFIG_FILE
    program_string += ' -r --eth ' + str(eth) + ' --vxlans'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading ETH' + str(eth) + ' VXLAN count failed')
        print(e)
        return None, e

# 5. Read UDP IP
def read_UDP_IP(eth):
    program_string = CONFIG_FILE
    program_string += ' -r --udp ' + str(eth) + ' --ip'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading UDP' + str(eth) + ' IP address failed')
        print(e)
        return None, e
    
# 6. Read UDP Gateway
def read_UDP_gateway(eth):
    program_string = CONFIG_FILE
    program_string += ' -r --udp ' + str(eth) + ' --gateway'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading UDP' + str(eth) + ' gateway failed')
        print(e)
        return None, e

# 7. Read UDP netmask
def read_UDP_netmask(eth):
    program_string = CONFIG_FILE
    program_string += ' -r --udp ' + str(eth) + ' --netmask'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading UDP' + str(eth) + ' netmask failed')
        print(e)
        return None, e

# 8. Read UDP MAC
def read_UDP_MAC(eth):
    program_string = CONFIG_FILE
    program_string += ' -r --udp ' + str(eth) + ' --mac'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading UDP' + str(eth) + ' MAC address failed')
        print(e)
        return None, e

# 9. Write UDP IP
def write_UDP_IP(eth, ip):
    program_string = CONFIG_FILE
    program_string += ' -w --udp ' + str(eth) + ' --ip ' + ip
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Setting UDP' + str(eth) + ' IP address failed')
        print(e)
        return e
    
# 10. Write UDP Gateway
def write_UDP_gateway(eth, gateway):
    program_string = CONFIG_FILE
    program_string += ' -w --udp ' + str(eth) + ' --gateway ' + gateway
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Setting UDP' + str(eth) + ' gateway failed')
        print(e)
        return e

# 11. Write UDP netmask
def write_UDP_netmask(eth, netmask):
    program_string = CONFIG_FILE
    program_string += ' -w --udp ' + str(eth) + ' --netmask ' + netmask
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Setting UDP' + str(eth) + ' netmask failed')
        print(e)
        return e

# 12. Write UDP MAC
def write_UDP_MAC(eth, mac):
    program_string = CONFIG_FILE
    program_string += ' -w --udp ' + str(eth) + ' --mac ' + mac
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Setting UDP' + str(eth) + ' MAC address failed')
        print(e)
        return e

# 13. Read VXLAN remote IP
def read_VXLAN_IP(eth, vxlan):
    program_string = CONFIG_FILE
    program_string += ' -r --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --ip'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' remote IP address failed')
        print(e)
        return None, e

# 14. Read VXLAN local port
def read_VXLAN_lport(eth, vxlan):
    program_string = CONFIG_FILE
    program_string += ' -r --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --local_port'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' local port failed')
        print(e)
        return None, e

# 15. Read VXLAN remote port
def read_VXLAN_rport(eth, vxlan):
    program_string = CONFIG_FILE
    program_string += ' -r --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --remote_port'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' remote port failed')
        print(e)
        return None, e

# 16. Read VXLAN VNI
def read_VXLAN_VNI(eth, vxlan):
    program_string = CONFIG_FILE
    program_string += ' -r --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --vni'
    try:
        output = subprocess.run(program_string, shell=True, capture_output=True, check=True)
        return output.stdout.decode('utf-8'), None
    except subprocess.SubprocessError as e:
        print('Reading ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' VNI failed')
        print(e)
        return None, e

# 17. Write VXLAN remote IP
def write_VXLAN_IP(eth, vxlan, ip):
    program_string = CONFIG_FILE
    program_string += ' -w --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --ip ' + ip
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Writing ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' remote IP address failed')
        print(e)
        return e

# 18. Write VXLAN local port
def write_VXLAN_lport(eth, vxlan, port):
    program_string = CONFIG_FILE
    program_string += ' -w --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --local_port ' + port
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Writing ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' local port failed')
        print(e)
        return e

# 19. Write VXLAN remote port
def write_VXLAN_rport(eth, vxlan, port):
    program_string = CONFIG_FILE
    program_string += ' -w --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --remote_port ' + port
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Writing ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' remote port failed')
        print(e)
        return e

# 20. Write VXLAN VNI
def write_VXLAN_VNI(eth, vxlan, vni):
    program_string = CONFIG_FILE
    program_string += ' -w --eth ' + str(eth) + ' --vxlan ' + str(vxlan) + ' --vni ' + vni
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Writing ETH' + str(eth) + ' VXLAN' + str(vxlan) + ' VNI failed')
        print(e)
        return e

# 21. Initialize
def init_shell():
    program_string = CONFIG_FILE
    program_string += ' -i'
    try:
        subprocess.run(program_string, shell=True, check=True)
        return None
    except subprocess.SubprocessError as e:
        print('Initializing shell failed')
        print(e)
        return e

# 22. Strings to Dict
def string_to_dict(string):
    return_dict = {}
    str_list = string.split('\n')
    for line in str_list:
        if ': ' in line:
            splits = line.split(': ')
            return_dict[splits[0]] = splits[1]
    return return_dict

# Rest API
# 1. Shell Info
# Example GET: curl http://localhost:5000/Info
@app.route('/Info', methods=['GET'])
def shell_info():
    output, failed = read_info()
    if failed:
        return str(failed), 404
    return flask.jsonify(string_to_dict(output))

# 2. ETH Count
# Example GET: curl http://localhost:5000/Eth/Count
@app.route('/Eth/Count', methods=['GET'])
def eth_count():
    output, failed = read_ETH_count()
    if failed:
        return str(failed), 404
    return flask.jsonify(output.strip())

# 3. ETH Speed
# Example GET: curl http://localhost:5000/Eth/0/Speed
@app.route('/Eth/<int:network_id>/Speed', methods=['GET'])
def eth_speed(network_id):
    output, failed = read_ETH_speed(network_id)
    if failed:
        return str(failed), 404
    return flask.jsonify(output.strip())

# 4. ETH VLXAN count
# Example GET: curl http://localhost:5000/Eth/0/VXLANs
@app.route('/Eth/<int:network_id>/VXLANs', methods=['GET'])
def vxlan_count(network_id):
    output, failed = read_VXLAN_count(network_id)
    if failed:
        return str(failed), 404
    return flask.jsonify(output.strip())

# 5. UDP configuration
# Example PUT: curl -X PUT -d '{"IP": "10.1.1.1"}' http://localhost:5000/UDP/0
# Example GET: curl http://localhost:5000/UDP/0
@app.route('/UDP/<int:network_id>', methods=['GET', 'PUT'])
def udp_config(network_id):
    if flask.request.method == 'PUT':
        data = flask.request.get_json(force=True)
        # Make sure the fields are correct
        for key in data:
            if key != 'IP' and key != 'Gateway' and key != 'Netmask' and key != 'MAC':
                return 'Wrong data format', 404
        
        if 'IP' in data:
            failed = write_UDP_IP(network_id, data['IP'])
            if failed:
                return str(failed), 404
        if 'Gateway' in data:
            failed = write_UDP_gateway(network_id, data['Gateway'])
            if failed:
                return str(failed), 404
        if 'Netmask' in data:
            failed = write_UDP_netmask(network_id, data['Netmask'])
            if failed:
                return str(failed), 404
        if 'MAC' in data:
            failed = write_UDP_MAC(network_id, data['MAC'])
            if failed:
                return str(failed), 404
    return_output = {}
    output, failed = read_UDP_IP(network_id)
    if failed:
        return str(failed), 404
    return_output['IP'] = output.strip()
    output, failed = read_UDP_gateway(network_id)
    if failed:
        return str(failed), 404
    return_output['Gateway'] = output.strip()
    output, failed = read_UDP_netmask(network_id)
    if failed:
        return str(failed), 404
    return_output['Netmask'] = output.strip()
    output, failed = read_UDP_MAC(network_id)
    if failed:
        return str(failed), 404
    return_output['MAC'] = output.strip()
    return flask.jsonify(return_output)

# 6. VXLAN configuration
# Example PUT: curl -X PUT -d '{"IP":"10.1.1.1","VNI":"123"}' http://localhost:5000/VXLAN/0/15
# Example GET: curl http://localhost:5000/VXLAN/1/10
@app.route('/VXLAN/<int:network_id>/<int:vxlan_id>', methods=['GET', 'PUT'])
def vxlan_config(network_id, vxlan_id):
    if flask.request.method == 'PUT':
        data = flask.request.get_json(force=True)
        # Make sure the fields are correct
        for key in data:
            if key != 'IP' and key != 'Local Port' and key != 'Remote Port' and key != 'VNI':
                return 'Wrong data format', 404
        
        if 'IP' in data:
            failed = write_VXLAN_IP(network_id, vxlan_id, data['IP'])
            if failed:
                return str(failed), 404
        if 'Local Port' in data:
            failed = write_VXLAN_lport(network_id, vxlan_id, data['Local Port'])
            if failed:
                return str(failed), 404
        if 'Remote Port' in data:
            failed = write_VXLAN_rport(network_id, vxlan_id, data['Remote Port'])
            if failed:
                return str(failed), 404
        if 'VNI' in data:
            failed = write_VXLAN_VNI(network_id, vxlan_id, data['VNI'])
            if failed:
                return str(failed), 404
    return_output = {}
    output, failed = read_VXLAN_IP(network_id, vxlan_id)
    if failed:
        return str(failed), 404
    return_output['IP'] = output.strip()
    output, failed = read_VXLAN_lport(network_id, vxlan_id)
    if failed:
        return str(failed), 404
    return_output['Local Port'] = output.strip()
    output, failed = read_VXLAN_rport(network_id, vxlan_id)
    if failed:
        return str(failed), 404
    return_output['Remote Port'] = output.strip()
    output, failed = read_VXLAN_VNI(network_id, vxlan_id)
    if failed:
        return str(failed), 404
    return_output['VNI'] = output.strip()
    return flask.jsonify(return_output)

# 7. Initialize System
@app.route('/Init', methods=['GET'])
def init_system():
    failed = init_shell()
    if failed:
        return str(failed), 404
    return None
