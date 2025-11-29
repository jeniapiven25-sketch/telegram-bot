import telebot
from flask import Flask, request

TOKEN = "8466917474:AAEy8VuXV_jdknhn8oNZgbFVyOnqFi-nadI"
bot = telebot.TeleBot(TOKEN)
app = Flask(_JP_bot__)

@bot.message_handler(commands=['start'])
def start(message):
    bot.send_message(message.chat.id, "Ciao, sono AI asistente di Jenia Piven")

@app.route("/" + TOKEN, methods=["POST"])
def webhook():
    update = request.stream.read().decode("utf-8")
    bot.process_new_updates([telebot.types.Update.de_json(update)])
    return "OK", 200

@app.route("/")
def default():
    return "Bot is running!", 200
