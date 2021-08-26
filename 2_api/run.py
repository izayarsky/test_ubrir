import requests
import json


response = requests.get("https://anapioficeandfire.com/api/characters/?culture=Westeros&isAlive=true")
data = json.loads(response.text)


with open ('output.txt', 'w') as f:
    for i in data:
        name = i["name"]
        actor_name = i["playedBy"][0]
        if actor_name:
            f.write(actor_name + '\n')
        else:
            print(f"ATTENTION: FOR {name} playedBy IS EMPTY")