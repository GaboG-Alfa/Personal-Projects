import os
import requests
from datetime import datetime
from dotenv import load_dotenv

load_dotenv()

GENDER = os.environ["GENDER"]
WEIGHT_KG = os.environ["WEIGHT_KG"]
HEIGHT_CM = os.environ["HEIGHT_CM"]
AGE = os.environ["AGE"]

APP_ID = os.environ["APP_ID"]
API_KEY = os.environ["API_KEY"]

exercise_endpoint = os.environ["EXERCISE_ENDPOINT"]
sheet_endpoint = os.environ["SHEET_ENDPOINT"]
token = os.environ["TOKEN"]

exercise_text = input("Tell me which exercises you did: ")

headers = {
    "x-app-id": APP_ID,
    "x-app-key": API_KEY,
}

parameters = {
    "query": exercise_text,
    "gender": GENDER,
    "weight_kg": float(WEIGHT_KG),
    "height_cm": float(HEIGHT_CM),
    "age": int(AGE),
}


response = requests.post(exercise_endpoint, json=parameters, headers=headers)

result = response.json()

today_date = datetime.now().strftime("%d/%m/%Y")
now_time = datetime.now().strftime("%X")

bearer_headers = {
    "Authorization": f"Bearer {token}"
}

for exercise in result["exercises"]:
    sheet_inputs = {
        "workout": {
            "date": today_date,
            "time": now_time,
            "exercise": exercise["name"].title(),
            "duration": exercise["duration_min"],
            "calories": exercise["nf_calories"],
        }
    }

    sheet_response = requests.post(
        sheet_endpoint,
        json=sheet_inputs,
        headers=bearer_headers,
    )

    print(sheet_response.status_code, sheet_response.text)