import urllib.request
import base64
import json
import time

url = "http://localhost/api/auth/login"
username = "ShareIndia"
password = "ShareIndia@123"

# Create Basic Auth Header
creds = f"{username}:{password}"
b64_creds = base64.b64encode(creds.encode()).decode()
headers = {
    "Authorization": f"Basic {b64_creds}",
    "Content-Type": "application/json"
}

print(f"Testing Login to: {url}")
print(f"User: {username}")

try:
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req) as response:
        print(f"Status Code: {response.getcode()}")
        data = response.read().decode()
        print(f"Response Body: {data}")
except urllib.error.HTTPError as e:
    print(f"HTTP Error: {e.code} - {e.reason}")
    print(e.read().decode())
except Exception as e:
    print(f"Error: {e}")
