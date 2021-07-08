#/bin/python3.8

import flask
import ShellAPI

# Do not delete the following three lines
app = flask.Flask(__name__)
app.register_blueprint(ShellAPI.app)
app.config['DEBUG'] = False

# Rest API
# Add yours here

# Initialize App
# 1. Delete any old configurations, if any
FILTER_FILE = ['./.filter0', './.filter1']
NO_FILTER_FILE = './.filter_acceptall'
COMPILE_FILE = './FirewallCompiler'
DOWNLOAD_FILE = './User'
if os.path.exists(FILTER_FILE[0]):
    os.remove(FILTER_FILE[0])
if os.path.exists(FILTER_FILE[1]):
    os.remove(FILTER_FILE[1])
# 2. Make sure the requried programs are compiled and available
if not os.path.exists(COMPILE_FILE):
    print('Please compile the compilefilter program first')
    exit(1)
if not os.path.exists(DOWNLOAD_FILE):
    print('Please compile the sendfilter program first')
    exit(1)

# Helper functions
def filter_to_dict(index):
    filter_file = open(FILTER_FILE[index], 'r')
    complete_filter = filter_file.read()[1:-1].split(' and ')
    filter_file.close()
    i = 0
    result = {}
    for line in complete_filter:
        result[i] = line[1:-1]
        i += 1
    return result

def program_firewall(index):
    try:
        filter_file = open(FILTER_FILE[index], 'r')
        complete_filter = filter_file.read()
        filter_file.close()
        subprocess.run(COMPILE_FILE + ' ' + complete_filter + ' ' + FILTER_FILE[index] + '_compiled', shell=True)
        subprocess.run(DOWNLOAD_FILE + ' ' + FILTER_FILE[index] + '_compiled 0x00A0400000 0x00A0410000 0x00A0420000 0x00A0430000 0x00A0440000 0x00A0450000', shell=True)
        subprocess.run(DOWNLOAD_FILE + ' ' + FILTER_FILE[index] + '_compiled 0x00A0500000 0x00A0510000 0x00A0520000 0x00A0530000 0x00A0540000 0x00A0550000', shell=True)
        # Clean up
        os.remove(FILTER_FILE[index] + '_compiled')
        if os.path.exists(FILTER_FILE[index] + '_orig'):
            os.remove(FILTER_FILE[index] + '_orig')
        return True
    except subprocess.CalledProcessError as e:
        shutil.move(FILTER_FILE[index] + '_orig', FILTER_FILE[index])
        print('Compiling filter failed')
        return False

def reset_firewall():
    try:
        subprocess.run(DOWNLOAD_FILE + ' ' + NO_FILTER_FILE + ' 0x00A0400000 0x00A0410000 0x00A0420000 0x00A0430000 0x00A0440000 0x00A0450000 0x00A0500000 0x00A0510000 0x00A0520000 0x00A0530000 0x00A0540000 0x00A0550000', shell=True)
        return True
    except subprocess.CalledProcessError as e:
        print('Compiling filter failed')
        return False

# Rest API
# 1. Add Rules, get rules, delete rules
# Example POST single: curl -X POST -d '"ABC"' http://localhost:5000/User/Rules/0
# Example POST multiple: curl -X POST -d '["ABC", "DEF"]' http://localhost:5000/User/Rules/1
# Example GET all: curl -X GET http://localhost:5000/User/Rules/0
# Example DELETE all: curl -X DELETE http://localhost:5000/User/Rules/1
@app.route('/User/Rules/<int:direction>', methods=['POST', 'GET', 'DELETE'])
def rules(direction):
    if flask.request.method == 'POST':
        data = flask.request.get_json(force=True)
        print(data)
        if isinstance(data, str):
            # Copy file in case new filter doesn't compile
            Exists = False
            if os.path.exists(FILTER_FILE[direction]):
                Exists = True
                shutil.copyfile(FILTER_FILE[direction], FILTER_FILE[direction] + '_orig')
            # Append new instructions
            if Exists:
                filter_file = open(FILTER_FILE[direction], 'r')
                complete_filter = filter_file.read()[:-1]
                filter_file.close()
                complete_filter += ' and (' + data + ')\"'
                filter_file = open(FILTER_FILE[direction], 'w')
                filter_file.write(complete_filter)
            else:
                filter_file = open(FILTER_FILE[direction], 'w')
                filter_file.write('\"(' + data + ')\"')
            filter_file.close()
            # Compile new instructions
            if not program_firewall(direction):
                return "Bad Instructions", 404
        elif isinstance(data, list):
            # Copy file in case new filter doesn't compile
            Exists = False
            if os.path.exists(FILTER_FILE[direction]):
                Exists = True
                shutil.copyfile(FILTER_FILE[direction], FILTER_FILE[direction] + '_orig')
            # Append new instructions
            if Exists:
                filter_file = open(FILTER_FILE[direction], 'r')
                complete_filter = filter_file.read()[:-1] + ' and ('
                filter_file.close()
                complete_filter += ') and ('.join(data) + ')\"'
                filter_file = open(FILTER_FILE[direction], 'w')
                filter_file.write(complete_filter)
            else:
                filter_file = open(FILTER_FILE[direction], 'w')
                filter_file.write('\"(' + ') and ('.join(data) + ')\"')
            filter_file.close()
            # Compile new instructions
            if not program_firewall(direction):
                return "Bad Instructions", 404
        else:
            return "Wrong data type", 404
    elif flask.request.method == 'DELETE':
        os.remove(FILTER_FILE)
        if not reset_firewall():
            return "Couldn't compile accept all filter", 404
        return "Accept all", 200
    return flask.jsonify(filter_to_dict(direction))

# Example GET single: curl -X GET http://localhost:5000/User/Rules/0/<id>
# Example DELETE single: curl -X DELETE http://localhost:5000/User/Rules/1/<id>
@app.route('/User/Rules/<int:direction>/<int:rule_id>', methods=['GET', 'DELETE'])
def single_rules(direction, rule_id):
    filter_file = open(FILTER_FILE[direction], 'r')
    complete_filter = filter_file.read()[1:-1].split(' and ')
    if flask.request.method == 'GET':
        filter_file.close()
        if rule_id >= len(complete_filter):
            return "Bad Index", 404
        return flask.jsonify(complete_filter[rule_id][1:-1])
    elif flask.request.method == 'DELETE':
        filter_file.close()
        if rule_id >= len(complete_filter):
            return "Bad Index", 404
        if len(complete_filter) == 1:
            os.remove(FILTER_FILE[direction])
            if not reset_firewall():
                return "Couldn't compile accept all filter", 404
            return "Accept all", 200
        filter_file = open(FILTER_FILE[direction], 'w')
        del complete_filter[rule_id]
        filter_file.write('\"' + ' and '.join(complete_filter) + '\"')
        filter_file.close()
        # Compile new instructions
        if not program_firewall(direction):
            return "Bad Instructions", 404
        return flask.jsonify(filter_to_dict(direction))

reset_firewall()

# Do not delete the followign two lines
if __name__ == '__main__':
    app.run(host='0.0.0.0')
