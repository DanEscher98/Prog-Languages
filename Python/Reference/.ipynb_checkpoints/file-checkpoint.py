import json

x = {
  "name": "John"
}

with open("data.json", "w") as w_file:
    json.dump(x, w_file, indent=4)

print(json.dumps(x, indent=4))