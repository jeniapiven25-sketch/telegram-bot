import telebot
from flask import Flask, request

# Inserisci qui il tuo token del bot
TOKEN = "INSERISCI_IL_TUO_TOKEN"

# Oggetto bot
bot = telebot.TeleBot(TOKEN)

# App Flask per Render (webhook)
app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    return "Bot Python attivo su Render! 🚀"

@app.route("/", methods=["POST"])
def webhook():
    json_string = request.get_data().decode("utf-8")
    update = telebot.types.Update.de_json(json_string)
    bot.process_new_updates([update])
    return "OK", 200

# Risposta al comando /start
@bot.message_handler(commands=["start"])
def start(message):
    bot.reply_to(message, "Ciao! Il bot Python è attivo! 😄")

# Per test locale
if __name__ == "__main__":
    bot.polling(none_stop=True)
