import json
import requests
from flask import Flask, Response

app = Flask(__name__)

@app.route('/hello', methods=['GET'])
def hello():
    return Response("{hello world}", mimetype='application/json')


# @app.route('/getresponse', methods=['GET'])
# def greeting():
#     return Response("{This is a response from the server}", mimetype='application/json')


@app.route('/getresponse', methods=['GET'])
def greeting():
    value = "Error! This is Not applicable"
    try:
        return Response("{This is a response from the server}", mimetype='application/json')
    except:
        "PASS"
    return value
    
    
    
