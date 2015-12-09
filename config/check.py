import requests
import sys

url = "http://localhost:9200/_cat/health"

def green():
    sys.exit()

def yellow():
    sys.exit(1)

def red():
    sys.exit(2)

codes = {
        "green": green,
        "yellow": yellow,
        "red": red,
    }

r = requests.get(url)
codes.get(r.text.split()[3], lambda: red)()
