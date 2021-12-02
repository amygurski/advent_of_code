# Part 1

result = {
    "forward": 0,
    "down": 0,
}

with open('input.txt') as f:
    for line in f.readlines():
        key,value = line.split(" ")
        if key == "up":
            result["down"] -= int(value)
        else:
            result[key] += int(value)

print(f'Part 1: {result["forward"] * result["down"]}')

# Part 2

result2 = {
    "forward": 0,
    "down": 0,
    "aim": 0
}

with open('input.txt') as f:
    for line in f.readlines():
        key,value = line.split(" ")
        if key == "down":
            result2["aim"] += int(value)
        elif key == "up":
            result2["aim"] -= int(value)
        else:
            result2["forward"] += int(value)
            result2["down"] += result2["aim"] * int(value)

print(f'Part 2: {result2["forward"] * result2["down"]}')