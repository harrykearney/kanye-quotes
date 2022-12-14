import json
import random
from flask import Flask, request, send_file, jsonify
from flask_restful import Resource, Api, reqparse, abort

app = Flask("KAAS Server")

@app.route("/")
def home():
    with open("/Users/hazza/Documents/Programming/Kanye Quotes/data.json", "r") as f:
        quotes = json.load(f)

        quote = random.choice(quotes)

        return {"quote": quote}, 200

if __name__ == "__main__":
    app.run(host="localhost", port=6969)