import pandas as pd

from flask          import Flask, request
from api.predict_model  import get_result


app = Flask(__name__)

@app.route('/test')
def test():

    return "API working!"


@app.route('/predict', methods=['POST'])
def predict():
    
    json_data = request.get_json()

    json_dates = get_result(json_data)

    return json_dates


if __name__ == "__main__":
    app.run(port=8000, debug=True)