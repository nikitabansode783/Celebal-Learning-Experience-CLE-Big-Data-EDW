
import requests

url = "https://jsonplaceholder.typicode.com/users"

try:
    response = requests.get(url, timeout=10)
    response.raise_for_status()

    users = response.json()

    for user in users[:5]:
        print(user["id"], user["name"], user["email"])

    print("API data fetched successfully!")

except requests.exceptions.RequestException as e:
    print("API Error:", e)
