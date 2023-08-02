import json
import requests
from flask import Flask, Response

app = Flask(__name__)

@app.route('/hello', methods=['GET'])
def hello():
    var = "N/A"
    try:
        return Response("{hello world}", mimetype='application/json')
    except:
        pass
    return var



@app.route('/getresponse', methods=['GET'])
def greeting():
    value = "Error! Not applicable"
    try:
        return Response("{This is a response from the server}", mimetype='application/json')
    except:
        pass
    return value
    
    
    
