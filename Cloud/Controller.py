#!/bin/python3

import flask
import time
import os
import argparse
import yaml
import ipaddress
import json
import requests
import random
import logging

with open('/var/run/secrets/kubernetes.io/serviceaccount/token', 'r') as file:
    header = file.read()
URL = 'https://kubernetes.default/api/v1/namespaces/nfv/pods'
VERIFY = '/var/run/secrets/kubernetes.io/serviceaccount/ca.crt'
HEADER = {'Authorization': 'Bearer ' + header}

POD_IPS = {}
CONFIGS = {}
FAILURES = {}

app = flask.Flask(__name__)

def parse_args():
    # Args
    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--verbose', help='increase output verbosity', action='store_true')
    parser.add_argument('-d', '--debug', help='enable debug mode', action='store_true')
    parser.add_argument('-i', '--cidr', help='pick the CIDR to use for VNFs', type=str, default='10.10.0.0/16')
    parser.add_argument('-c', '--config', help='specify the configuration file of VNFs', type=str, default='./config.yaml')
    args = parser.parse_args()
    return args

def create_IPs(cidr):
    # Create a list of possible IP addresses from the given CIDR
    IPs = [int(ip) for ip in ipaddress.IPv4Network(cidr)]
    return IPs

def read_config(config_file):
    # Read config
    try:
        with open(config_file) as file:
            config = yaml.load(file, Loader=yaml.FullLoader)
    except IOError as e:
        logging.error('Couldn\'t read file. Exception: ', e)
        exit(1)
    return config

def verify_config(config, cidr, IPs):
    # Verify Config
    # 1. Make sure there's always at least 1 source (there can be no destinations, 
    #       for example for analytics that get sent to the CPU but nothing else)
    # 2. Make sure the VXLAN specs are complete
    # 3. Make sure any used IPs are inside the CIDR
    # 4. Make sure VNIs are unique
    # 5. Make sure source and destination names exist
    # 6. TODO: Make sure the graph is balanced
    used_VNIs = []
    used_IPs = []
    for name, details in config.items():
        if 'sources' not in details:
            logging.error('VNF ' + name + ' doesn\'t have sources')
            exit(2)
        if 'destinations' not in details:
            check_dest = False
        else:
            check_dest = True
        for item in details['sources']:
            if isinstance(item, dict):
                if 'IP' not in item or 'VNI' not in item or 'Port' not in item:
                    logging.error('VXLAN specification in ' + name + '\'s sources is incomplete')
                    exit(3)
                if ipaddress.IPv4Address(item['IP']) not in ipaddress.IPv4Network(cidr):
                    # logging.error('VXLAN IP in ' + name + '\'s sources is outside the given CIDR')
                    # exit(4)
                    # It's probably enough to warn about this, we had cases where we needed this IP
                    # to be outside CIDR
                    logging.warning('VXLAN IP in ' + name + '\'s sources is outside the given CIDR')
                else:
                    IPs.remove(int(ipaddress.IPv4Address(item['IP'])))
                if item['VNI'] in used_VNIs:
                    logging.error('VXLAN VNI of ' + name + '\'s sources is not using a unique VNI')
                    exit(5)
                used_VNIs.append(item['VNI'])
            elif isinstance(item, str):
                if item not in config:
                    logging.error('No such destination: ' + item)
                    exit(6)
            else:
                logging.error('Unknown format for destination: ' + item)
                exit(7)
        if check_dest:
            for item in details['destinations']:
                if isinstance(item, dict):
                    if 'IP' not in item or 'VNI' not in item or 'Port' not in item:
                        logging.error('VXLAN specification in ' + name + '\'s destinations is incomplete')
                        exit(3)
                    if ipaddress.IPv4Address(item['IP']) not in ipaddress.IPv4Network(cidr):
                        # logging.error('VXLAN IP in ' + name + '\'s destinations is outside the given CIDR')
                        # exit(4)
                        # It's probably enough to warn about this, we had cases where we needed this IP
                        # to be outside CIDR
                        logging.warning('VXLAN IP in ' + name + '\'s destinations is outside the given CIDR')
                    else:
                        IPs.remove(int(ipaddress.IPv4Address(item['IP'])))
                    if item['VNI'] in used_VNIs:
                        logging.error('VXLAN VNI of ' + name + '\'s destinations is not using a unique VNI')
                        exit(5)
                    used_VNIs.append(item['VNI'])
                elif isinstance(item, str):
                    if item not in config:
                        logging.error('No such source: ' + item)
                        exit(6)
                else:
                    logging.error('Unknown format for source: ' + item)
                    exit(7)
    return used_VNIs

def delete_VNF(name):
    try:
        response = requests.delete(URL + '/' + name, headers=HEADER, verify=VERIFY)
        if response.status_code < 200 or response.status_code >= 300:
            logging.error('Couldn\'t delete VNF ' + name + '.')
            logging.error('Details: ')
            logging.error(response.code)
            logging.error(response.text)
    except requests.exceptions.RequestException as e:
        logging.error('Couldn\'t delete VNF ' + name + '.')
        logging.error('Caused by:')
        logging.error(str(e))
        # Don't exit, this is deletion

def delete_VNFs(config):
    # Start deleting the VNFs one by one
    for name, details in config.items():
        for i in range(details['replicas']):
            if i == 0 and details['replicas'] == 1:
                suffix = ''
            else:
                suffix = '-' + str(i)
            delete_VNF(name + suffix)

def deploy_VNF(name, suffix):
    deploy = {}
    deploy['apiVersion'] = 'v1'
    deploy['kind'] = 'Pod'
    deploy['metadata'] = {}
    deploy['metadata']['name'] = name + suffix
    deploy['metadata']['namespace'] = 'nfv'
    deploy['spec'] = {}
    deploy['spec']['containers'] = [{}]
    deploy['spec']['containers'][0]['name'] = name + '-container' + suffix
    deploy['spec']['containers'][0]['image'] = details['image']
    deploy['spec']['containers'][0]['volumeMounts'] = [{'name': 'firmware', 
            'mountPath': '/lib/firmware'}, {'name': 'dev-mem', 'mountPath': 
            '/dev/mem'}]
    deploy['spec']['containers'][0]['securityContext'] = {'privileged': True, 
            'runAsUser': 0}
    deploy['spec']['containers'][0]['resources'] = {}
    deploy['spec']['containers'][0]['resources']['limits'] = {details['resource']
            ['vendor'] + '/' + details['resource']['device']: 1}
    deploy['spec']['containers'][0]['livenessProbe'] = {}
    deploy['spec']['containers'][0]['livenessProbe']['httpGet'] = {}
    deploy['spec']['containers'][0]['livenessProbe']['httpGet']['port'] = 5000
    deploy['spec']['containers'][0]['livenessProbe']['httpGet']['path'] = '/Eth/Count'
    deploy['spec']['containers'][0]['livenessProbe']['initialDelaySeconds'] = 10
    deploy['spec']['containers'][0]['livenessProbe']['periodSeconds'] = 1
    deploy['spec']['volumes'] = [{}, {}]
    deploy['spec']['volumes'][0]['name'] = 'dev-mem'
    deploy['spec']['volumes'][0]['hostPath'] = {'path': '/dev/mem'}
    deploy['spec']['volumes'][1]['name'] = 'firmware'
    deploy['spec']['volumes'][1]['hostPath'] = {'path': '/lib/firmware'}
    deploy['spec']['restartPolicy'] = 'OnFailure'
    try:
        response = requests.post(URL, headers=HEADER, json=deploy, verify=VERIFY)
        if response.status_code < 200 or response.status_code >= 300:
            logging.error('Couldn\'t deploy VNF ' + name + suffix + '.')
            logging.error('Details: ')
            logging.error(response.status_code)
            logging.error(response.text)
            delete_VNFs(config)
            exit(8)
    except requests.exceptions.RequestException as e:
        logging.error('Couldn\'t deploy VNF ' + name + suffix + '.')
        logging.error('Caused by:')
        logging.error(str(e))
        delete_VNFs(config)
        exit(8)

def deploy_VNFs(config):
    # Start deploying the VNFs one by one
    for name, details in config.items():
        for i in range(details['replicas']):
            if i == 0 and details['replicas'] == 1:
                suffix = ''
            else:
                suffix = '-' + str(i)
            deploy_VNF(name, suffix)

def deploy_debug():
    # Deploy an alpine image that the user can connect to and use for debugging
    deploy = {}
    deploy['apiVersion'] = 'v1'
    deploy['kind'] = 'Pod'
    deploy['metadata'] = {}
    deploy['metadata']['name'] = 'busybox'
    deploy['metadata']['namespace'] = 'nfv'
    deploy['spec'] = {}
    deploy['spec']['containers'] = [{}]
    deploy['spec']['containers'][0]['name'] = 'busybox'
    deploy['spec']['containers'][0]['image'] = 'yauritux/busybox-curl'
    deploy['spec']['containers'][0]['command'] = ['sleep', '10000']
    deploy['spec']['restartPolicy'] = 'Never'
    deploy['spec']['nodeSelector'] = {'kubernetes.io/arch': 'amd64'}
    try:
        response = requests.post(URL, headers=HEADER, json=deploy, verify=VERIFY)
        if response.status_code < 200 or response.status_code >= 300:
            logging.error('Couldn\'t deploy debug pod.')
            logging.error('Details: ')
            logging.error(response.status_code)
            logging.error(response.text)
    except requests.exceptions.RequestException as e:
        logging.error('Couldn\'t deploy debug pod.')
        logging.error('Caused by:')
        logging.error(str(e))

def verify_VNFs(config):
    start = time.time()
    # Now that everything is deployed, we should wait for all VNFs to start up
    for name, details in config.items():
        for i in range(details['replicas']):
            if i == 0 and details['replicas'] == 1:
                suffix = ''
            else:
                suffix = '-' + str(i)
            while True:
                try:
                    response = requests.get(URL + '/' + name + suffix + '/status', headers=HEADER, verify=VERIFY)
                    response = json.loads(response.text)
                except requests.exceptions.RequestException as e:
                    logging.error('Couldn\'t verify status of VNF ' + name + suffix + '.')
                    logging.error('Caused by:')
                    logging.error(str(e))
                    delete_VNFs(config)
                    exit(9)
                # Wait until it's not pending
                if response['status']['phase'] != 'Pending':
                    break
            if response['status']['phase'] == 'Failed' or response['status']['phase'] == 'Unknown':
                # Any failures in the beginning are most likely failures we can't fix
                logging.error('Pod ' + name + suffix + ' was not successfully deployed')
                logging.error('Details: ')
                logging.error(response['status']['phase'])
                logging.error(response['status']['conditions'])
                delete_VNFs(config)
                exit(10)
            if response['status']['phase'] == 'Succeeded':
                # Nothing we can do about this too
                logging.error('Pod ' + name + suffix + ' has finished successfully. VNF pods shouldn\'t finish.')
                delete_VNFs(config)
                exit(11)
            # If we get here, status is Running, which is good.
            POD_IPS[name + suffix] = response['status']['podIP']
            FAILURES[name + suffix] = 0

def configure_VNFs(config, IPs, VNIs):

    def send_VXLAN_config(name, suffix, network, index, payload):
        url = 'http://' + POD_IPS[name + suffix] + ':5000/VXLAN/' + str(network) + '/' + str(index)
        logging.info('Configuring ' + name + suffix + '\'s network ' + str(network) + '-' + str(index) + ' with:')
        logging.info('\t' + str(payload))
        if name + suffix not in CONFIGS:
            CONFIGS[name + suffix] = []
        CONFIGS[name + suffix].append((url, payload))
        try:
            response = requests.put(url, json=payload)
            if response.status_code < 200 or response.status_code >= 300:
                logging.error('Failed to configure VXLAN of pod ' + name + suffix)
                logging.error('Details: ')
                logging.error(response.status_code)
                logging.error(POD_IPS[name + suffix])
                logging.error(response.text)
                delete_VNFs(config)
                exit(12)
        except requests.exceptions.RequestException as e:
            logging.error('Failed to configure VXLAN of pod ' + name + suffix)
            logging.error('Caused by:')
            logging.error(POD_IPS[name + suffix])
            logging.error(str(e))
            delete_VNFs(config)
            exit(12)

    def send_IP_config(name, suffix, network, IP):
        url = 'http://' + POD_IPS[name + suffix] + ':5000/UDP/' + str(network)
        logging.info('Configuring ' + name + suffix + '\'s network ' + str(network) + ' with IP: ' + IP)
        if name + suffix not in CONFIGS:
            CONFIGS[name + suffix] = []
        CONFIGS[name + suffix].append((url, {'ip': IP}))
        try:
            response = requests.put(url, json={'ip': IP})
            if response.status_code < 200 or response.status_code >= 300:
                logging.error('Failed to configure IP of pod ' + name + suffix)
                logging.error('Details: ')
                logging.error(response.status_code)
                logging.error(POD_IPS[name + suffix])
                logging.error(response.text)
                delete_VNFs(config)
                exit(13)
        except requests.exceptions.RequestException as e:
            logging.error('Failed to configure IP of pod ' + name + suffix)
            logging.error('Caused by:')
            logging.error(POD_IPS[name + suffix])
            logging.error(str(e))
            delete_VNFs(config)
            exit(13)

    def send_init(name, suffix):
        url = 'http://' + POD_IPS[name + suffix] + ':5000/Init'
        logging.info('Initializing ' + name + suffix)
        if name + suffix not in CONFIGS:
            CONFIGS[name + suffix] = []
        CONFIGS[name + suffix].append((url, {}))
        try:
            response = requests.put(url, json={})
            if response.status_code < 200 or response.status_code >= 300:
                logging.error('Failed to initialize pod ' + name + suffix)
                logging.error('Details: ')
                logging.error(response.status_code)
                logging.error(POD_IPS[name + suffix])
                logging.error(response.text)
                delete_VNFs(config)
                exit(13)
        except requests.exceptions.RequestException as e:
            logging.error('Failed to initialize pod ' + name + suffix)
            logging.error('Caused by:')
            logging.error(POD_IPS[name + suffix])
            logging.error(str(e))
            delete_VNFs(config)
            exit(13)

    def unique_VNI(VNIs):
        while True:
            VNI = random.randint(0, (2**24)-1)
            if VNI not in VNIs:
                VNIs.append(VNI)
                return VNI

    assigned_IPs = {}
    assigned_VNIs = {}
    # Now that everything is deployed and works, we should start assigining IPs
    for name, details in config.items():
        for i in range(details['replicas']):
            if i == 0 and details['replicas'] == 1:
                suffix = ''
            else:
                suffix = '-' + str(i)
            # Generate two unique IPs
            IP0 = IPs.pop()
            IP0 = str(ipaddress.IPv4Address(IP0))
            IP1 = IPs.pop()
            IP1 = str(ipaddress.IPv4Address(IP1))
            # Save this IP
            assigned_IPs[name+suffix] = {0: IP0, 1: IP1}
            # Configure the internal IP address
            send_IP_config(name, suffix, 0, IP0)
            send_IP_config(name, suffix, 1, IP1)
    # Handle all the source VXLANs
    for name, details in config.items():
        source_index = 0
        for item in details['sources']:
            if isinstance(item, dict):
                # This is an outside VXLAN bridge, need to use its IP, VNI, and port 
                # as is for our bridges
                if isinstance(item['VNI'], int) and details['replicas'] != 1:
                    logging.error('Must have as many VNIs as replicas for the predefined sources')
                    exit(14)
                elif isinstance(item['VNI'], list) and details['replicas'] != len(item['VNI']):
                    logging.error('Must have as many VNIs as replicas for the predefined sources')
                    exit(14)
                for i in range(details['replicas']):
                    if i == 0 and details['replicas'] == 1:
                        suffix = ''
                        VNI = item['VNI']
                    else:
                        suffix = '-' + str(i)
                        VNI = item['VNI'][i]
                    # Configure this VXLAN bridge on the VNF pod
                    payload = {'IP': item['IP'], 'VNI': str(VNI), 'Local Port': str(item['Port']), 'Remote Port': str(item['Port'])}
                    send_VXLAN_config(name, suffix, 0, source_index, payload)
            else:
                # This is an inside connection, do the following:
                # 1. Pick a unique VNI
                # 2. Save this VNI so our destination can use it too
                for i in range(details['replicas']):
                    for j in range(config[item]['replicas']):
                        VNI = unique_VNI(VNIs)
                        if j == 0 and config[item]['replicas'] == 1:
                            target_suffix = ''
                        else:
                            target_suffix = '-' + str(j)
                        target_IP = assigned_IPs[item+target_suffix][1]
                        if item+target_suffix not in assigned_VNIs:
                            assigned_VNIs[item+target_suffix] = []
                        assigned_VNIs[item+target_suffix].append(VNI)
                        # Configure this VXLAN bridge on the VNF pod
                        payload = {'IP': target_IP, 'VNI': str(VNI), 'Local Port': '3030', 'Remote Port': '3030'}
                        send_VXLAN_config(name, suffix, 0, source_index, payload)
            source_index += 1
    # Handle all the destination VXLANs
    for name, details in config.items():
        destination_index = 0
        for item in details['destinations']:
            if isinstance(item, dict):
                # This is an outside VXLAN bridge, need to use its IP, VNI, and port 
                # as is for our bridges
                if isinstance(item['VNI'], int) and details['replicas'] != 1:
                    logging.error('Must have as many VNIs as replicas for the predefined destinations')
                    exit(14)
                elif isinstance(item['VNI'], list) and details['replicas'] != len(item['VNI']):
                    logging.error('Must have as many VNIs as replicas for the predefined destinations')
                    exit(14)
                for i in range(details['replicas']):
                    if i == 0 and details['replicas'] == 1:
                        suffix = ''
                        VNI = item['VNI']
                    else:
                        suffix = '-' + str(i)
                        VNI = item['VNI'][i]
                    # Configure this VXLAN bridge on the VNF pod
                    payload = {'IP': item['IP'], 'VNI': str(VNI), 'Local Port': str(item['Port']), 'Remote Port': str(item['Port'])}
                    send_VXLAN_config(name, suffix, 1, destination_index, payload)
                    send_init(name, suffix)
            else:
                # This is an inside connection, do the following:
                # 1. Pick a unique VNI
                # 2. Save this VNI so our destination can use it too
                for i in range(details['replicas']):
                    if i == 0 and details['replicas'] == 1:
                        suffix = ''
                    else:
                        suffix = '-' + str(i)
                    for j in range(config[item]['replicas']):
                        if j == 0 and config[item]['replicas'] == 1:
                            target_suffix = ''
                        else:
                            target_suffix = '-' + str(j)
                        target_IP = assigned_IPs[item+target_suffix][0]
                        VNI = assigned_VNIs[name+suffix].pop(0)
                        # Configure this VXLAN bridge on the VNF pod
                        payload = {'IP': target_IP, 'VNI': str(VNI), 'Local Port': '3030', 'Remote Port': '3030'}
                        send_VXLAN_config(name, suffix, 1, destination_index, payload)
                        send_init(name, suffix)
            destination_index += 1   

def reconfigure_VNF(name):
    def send_config(name, url, payload):
        try:
            response = requests.put(url, json=payload)
            if response.status_code < 200 or response.status_code >= 300:
                logging.error('Failed to reconfigure pod ' + name + suffix)
                logging.error('Details: ')
                logging.error(response.status_code)
                logging.error(POD_IPS[name + suffix])
                logging.error(response.text)
                delete_VNFs(config)
                exit(12)
        except requests.exceptions.RequestException as e:
            logging.error('Failed to reconfigure pod ' + name + suffix)
            logging.error('Caused by:')
            logging.error(POD_IPS[name + suffix])
            logging.error(str(e))
            delete_VNFs(config)
            exit(12)
    time.sleep(5)
    logging.info('Reconfiguring ' + name + '\'s interfaces')
    if name not in CONFIGS:
        logging.error('Cannot find configuration for pod ' + name)
        delete_VNFs(config)
        exit(15)
    for config in CONFIGS[name]:
        send_config(name, config[0], config[1])

def check_health(config):
    # Now that everything is deployed, we should wait for all VNFs to start up
    while True:
        for name, details in config.items():
            for i in range(details['replicas']):
                if i == 0 and details['replicas'] == 1:
                    suffix = ''
                else:
                    suffix = '-' + str(i)
                try:
                    response = requests.get(URL + '/' + name + suffix + '/status', headers=HEADER, verify=VERIFY)
                    response = json.loads(response.text)
                except requests.exceptions.RequestException as e:
                    logging.error('Couldn\'t verify status of VNF ' + name + suffix + '.')
                    logging.error('Caused by:')
                    logging.error(str(e))
                    delete_VNFs(config)
                    exit(9)
                if response['status']['containerStatuses'][0]['restartCount'] > FAILURES[name + suffix]:
                    logging.warning('Pod ' + name + suffix + ' has restarted. Reconfiguring.')
                    FAILURES[name + suffix] = response['status']['containerStatuses'][0]['restartCount']
                    reconfigure_VNF(name + suffix)

if __name__ == '__main__':
    logging.getLogger('requests.packages.urllib3.connectionpool').setLevel(logging.WARNING)
    args = parse_args()
    if args.verbose:
        logging.basicConfig(level=logging.INFO)
    else:
        logging.basicConfig(level=logging.WARNING)
    IPs = create_IPs(args.cidr)
    config = read_config(args.config)
    VNIs = verify_config(config, args.cidr, IPs)
    if args.debug:
        deploy_debug()
    deploy_VNFs(config)
    verify_VNFs(config)
    time.sleep(5)
    configure_VNFs(config, IPs, VNIs)
    check_health(config)
