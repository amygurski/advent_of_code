with open("input.txt") as f:
    rows = [line.strip() for line in f.readlines()]
    height_map = []
    for row in rows:
        split_row = [int(c) for c in row]
        height_map.append(split_row)

def get_neighbors(x,y,height_map):
    neighbors = []
    if y > 0:
        neighbors.append(height_map[x][y-1]) # left
    if y < len(height_map[0])-1:
        neighbors.append(height_map[x][y+1]) # right
    if x > 0:
        neighbors.append(height_map[x-1][y]) # up
    if x < len(height_map) - 1:
        neighbors.append(height_map[x+1][y]) # down
   
    return neighbors

risk_level = 0
for x in range(len(height_map)):
    for y in range(len(height_map[0])):
        neighbors = get_neighbors(x,y,height_map)
        if height_map[x][y] < min(neighbors):
            risk_level += height_map[x][y] + 1

print(f"Sum of the risk level of the low points: {risk_level}")
