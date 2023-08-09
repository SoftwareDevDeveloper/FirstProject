import json
import requests
from flask import Flask, Response

app = Flask(__name__)


@app.route('/hello', methods=['GET'])
def hello():
    result = "pass"
    try:
        return Response("{hello world}", mimetype='application/json')
    except:
        result = "N/A"

    return result


@app.route('/getresponse', methods=['GET'])
def greeting():
    value = "Error! Not applicable"
    try:
        return Response("{This is a response from the server}", mimetype='application/json')
    except:
        value = 'pass' 
    return value
    
    
    
