import requests
import time
import json
import random
import string
from IPython.display import display, Javascript

# Configurations
BOT_TOKEN = '6897986170:AAEK6QH9yPRbLU3OqktIuSi8Wq88EH8qIVY'
CHAT_ID = '1759442322'
KEYS_DAY_COUNT = 3  # Number of days to generate keys for
MAX_KEYS_PER_DAY = 4
WAIT_TIME_SECONDS = 2*60  # 2 minutes between generating keys for each day (in seconds)

# Game configurations
games = {
    1: {'name': 'Riding Extreme 3D', 'appToken': 'd28721be-fd2d-4b45-869e-9f253b554e50', 'promoId': '43e35910-c168-4634-ad4f-52fd764a843f', 'eventsDelay': 21000, 'attemptsNumber': 22},
    2: {'name': 'Chain Cube 2048', 'appToken': 'd1690a07-3780-4068-810f-9b5bbf2931b2', 'promoId': 'b4170868-cef0-424f-8eb9-be0622e8e8e3', 'eventsDelay': 20000, 'attemptsNumber': 10},
    3: {'name': 'My Clone Army', 'appToken': '74ee0b5b-775e-4bee-974f-63e7f4d5bacb', 'promoId': 'fe693b26-b342-4159-8808-15e3ff7f8767', 'eventsDelay': 120000, 'attemptsNumber': 11},
    4: {'name': 'Train Miner', 'appToken': '82647f43-3f87-402d-88dd-09a90025313f', 'promoId': 'c4480ac7-e178-4973-8061-9ed5b2e17954', 'eventsDelay': 20000, 'attemptsNumber': 10},
    5: {'name': 'MergeAway', 'appToken': '8d1cc2ad-e097-4b86-90ef-7a27e19fb833', 'promoId': 'dc128d28-c45b-411c-98ff-ac7726fbaea4', 'eventsDelay': 20000, 'attemptsNumber': 10},
    6: {'name': 'Twerk Race 3D', 'appToken': '61308365-9d16-4040-8bb0-2f4a4c69074c', 'promoId': '61308365-9d16-4040-8bb0-2f4a4c69074c', 'eventsDelay': 20000, 'attemptsNumber': 10}
}

# Helper functions
def generate_client_id():
    timestamp = int(time.time() * 1000)
    random_numbers = ''.join(random.choices(string.digits, k=19))
    return f"{timestamp}-{random_numbers}"

def login(client_id, app_token):
    response = requests.post('https://api.gamepromo.io/promo/login-client', json={
        'appToken': app_token,
        'clientId': client_id,
        'clientOrigin': 'deviceid'
    })
    if response.ok:
        return response.json()['clientToken']
    else:
        raise Exception('Failed to login')

def emulate_progress(client_token, promo_id):
    response = requests.post('https://api.gamepromo.io/promo/register-event', headers={
        'Authorization': f'Bearer {client_token}',
        'Content-Type': 'application/json'
    }, json={
        'promoId': promo_id,
        'eventId': generate_uuid(),
        'eventOrigin': 'undefined'
    })
    return response.json().get('hasCode', False)

def generate_key(client_token, promo_id):
    response = requests.post('https://api.gamepromo.io/promo/create-code', headers={
        'Authorization': f'Bearer {client_token}',
        'Content-Type': 'application/json'
    }, json={'promoId': promo_id})
    if response.ok:
        key = response.json().get('promoCode')
        print(f"Generated key: {key}")  # Debug print
        return key
    else:
        raise Exception('Failed to generate key')

def generate_uuid():
    return ''.join(random.choices('abcdef0123456789', k=32))

def generate_keys_for_game(game, client_token, retries=3):
    keys = []
    for _ in range(MAX_KEYS_PER_DAY):
        success = False
        for attempt in range(game['attemptsNumber']):
            time.sleep(game['eventsDelay'] / 1000 * random.uniform(1, 1.5))  # Random delay
            if emulate_progress(client_token, game['promoId']):
                key = None
                for _ in range(retries):
                    try:
                        key = generate_key(client_token, game['promoId'])
                        if key and key not in keys:  # Ensure the key is unique
                            keys.append(key)
                            print(f"Generated key for {game['name']}: [{', '.join(keys)}]")
                            success = True
                            break
                    except Exception as e:
                        print(f"Retry error for {game['name']}: {e}")
                if success:
                    break
        if not success:
            print(f"Failed to generate key for {game['name']}")
    return keys

def format_keys_for_telegram(keys):
    formatted_message = ""
    for game_name, key_list in keys.items():
        formatted_message += f"*{game_name}*\n"
        formatted_message += f"[{', '.join(key_list)}]\n\n\n"
    formatted_message += "Bot Created By Ruman Hossain & Nahid"
    return formatted_message

def send_telegram_message(text):
    url = f'https://api.telegram.org/bot{BOT_TOKEN}/sendMessage'
    payload = {
        'chat_id': CHAT_ID,
        'text': text,
        'parse_mode': 'Markdown'
    }
    response = requests.post(url, data=payload)
    return response

def keep_alive():
    display(Javascript('''
        function keepSessionAlive() {
            console.log("Keep session alive script executed");
            var xhr = new XMLHttpRequest();
            xhr.open('GET', 'https://example.com', true); // Dummy request to keep session alive
            xhr.send();
            setTimeout(keepSessionAlive, 60000); // Repeat every minute
        }
        keepSessionAlive();
    '''))

def main():
    keep_alive()  # Attempt to keep session alive
    for day in range(KEYS_DAY_COUNT):
        print(f"Generating keys for day {day + 1}...")
        keys = {}
        for game_id, game in games.items():
            print(f"Generating keys for {game['name']}...")
            client_id = generate_client_id()
            try:
                client_token = login(client_id, game['appToken'])
                keys[game['name']] = generate_keys_for_game(game, client_token)
            except Exception as e:
                print(f"Error: {e}")

        formatted_message = format_keys_for_telegram(keys)
        response = send_telegram_message(formatted_message)
        if response.ok:
            print(f"Keys for day {day + 1} sent successfully.")
        else:
            print(f"Failed to send keys for day {day + 1}.")

        print(f"Waiting for {WAIT_TIME_SECONDS} seconds before generating keys for the next day...")
        time.sleep(WAIT_TIME_SECONDS)  # Wait for the specified time

if __name__ == "__main__":
    main()
