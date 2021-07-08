#/bin/python3.8

import flask
import ShellAPI

# Do not delete the following three lines
app = flask.Flask(__name__)
app.register_blueprint(ShellAPI.app)
app.config['DEBUG'] = False

# Rest API
# Add yours here

# Do not delete the followign two lines
if __name__ == '__main__':
    app.run(host='0.0.0.0')
