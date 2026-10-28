import os
import smtplib
from email.message import EmailMessage

import requests
from dotenv import load_dotenv

load_dotenv()

OWM_Endpoint = "https://api.openweathermap.org/data/2.5/forecast"

api_key = os.getenv("OWM_API_KEY")
email_address = os.getenv("EMAIL_ADDRESS")
email_password = os.getenv("EMAIL_APP_PASSWORD")
email_to = os.getenv("EMAIL_TO")

weather_params = {
    "lat": 10.089001,
    "lon": -84.291430,
    "appid": api_key,
    "cnt": 4,
}

response = requests.get(OWM_Endpoint, params=weather_params)
response.raise_for_status()
weather_data = response.json()

will_rain = any(int(hour["weather"][0]["id"]) < 700 for hour in weather_data["list"])

if will_rain:
    msg = EmailMessage()
    msg["Subject"] = "Alerta de lluvia ☔"
    msg["From"] = email_address
    msg["To"] = email_to
    msg.set_content("Va a llover hoy. Lleva paraguas ☔")

    with smtplib.SMTP("smtp.gmail.com", 587) as server:
        server.starttls()
        server.login(email_address, email_password)
        server.send_message(msg)
    print("Correo enviado.")
else:
    print("No va a llover.")