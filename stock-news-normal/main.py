import os
import smtplib
from email.message import EmailMessage

import requests
from dotenv import load_dotenv

load_dotenv()

STOCK_NAME = "TSLA"
COMPANY_NAME = "Tesla Inc"
THRESHOLD = 5  # porcentaje mínimo de cambio

STOCK_ENDPOINT = "https://www.alphavantage.co/query"
NEWS_ENDPOINT = "https://newsapi.org/v2/everything"

STOCK_API_KEY = os.environ["STOCK_API_KEY"]
NEWS_API_KEY = os.environ["NEWS_API_KEY"]
EMAIL_ADDRESS = os.environ["EMAIL_ADDRESS"]
EMAIL_APP_PASSWORD = os.environ["EMAIL_APP_PASSWORD"]
EMAIL_TO = os.environ["EMAIL_TO"]


def send_email(subject, body):
    msg = EmailMessage()
    msg["Subject"] = subject
    msg["From"] = EMAIL_ADDRESS
    msg["To"] = EMAIL_TO
    msg.set_content(body)

    with smtplib.SMTP("smtp.gmail.com", 587) as connection:
        connection.starttls()
        connection.login(EMAIL_ADDRESS, EMAIL_APP_PASSWORD)
        connection.send_message(msg)


# ---------- PASO 1: precios ----------
stock_params = {
    "function": "TIME_SERIES_DAILY",
    "symbol": STOCK_NAME,
    "apikey": STOCK_API_KEY,
}
response = requests.get(STOCK_ENDPOINT, params=stock_params)
response.raise_for_status()
data = response.json()["Time Series (Daily)"]
data_list = [value for (_, value) in data.items()]

yesterday_closing_price = float(data_list[0]["4. close"])
day_before_yesterday_closing_price = float(data_list[1]["4. close"])

difference = yesterday_closing_price - day_before_yesterday_closing_price
up_down = "🔺" if difference > 0 else "🔻"

diff_percent = round((difference / day_before_yesterday_closing_price) * 100, 2)
print(f"{STOCK_NAME}: {up_down}{diff_percent}%")

# ---------- PASO 2: noticias ----------
if abs(diff_percent) > THRESHOLD:
    news_params = {
        "apiKey": NEWS_API_KEY,
        "qInTitle": COMPANY_NAME,
    }
    news_response = requests.get(NEWS_ENDPOINT, params=news_params)
    news_response.raise_for_status()
    articles = news_response.json()["articles"]
    three_articles = articles[:3]

    # ---------- PASO 3: enviar por correo ----------
    for article in three_articles:
        subject = f"{STOCK_NAME}: {up_down}{diff_percent}%"
        body = (
            f"Headline: {article['title']}\n\n"
            f"Brief: {article['description']}\n\n"
            f"Link: {article['url']}"
        )
        send_email(subject, body)
    print("Correos enviados.")
else:
    print("Cambio menor al umbral, no se envían noticias.")