def get_coords(diagonal=False):
    """Get lines coordinates from file.
    Each coordinate will be added to a dictionary. The key is the coordinate.
    The value is the number of times a line passes through that coordinate.
    Default does horizontal and vertical lines.
    Optional diagonal argument includes diagonal lines.
    """
    coords_count_dict = {}
    y = 0
    with open("input.txt", "r") as f:
        for line in f.readlines():
            arr = line.strip().split(" -> ")
            first = arr[0].split(",")
            second = arr[1].split(",")
            x1 = int(first[0])
            y1 = int(first[1])
            x2 = int(second[0])
            y2 = int(second[1])
            if x1 == x2:
                for y in range(min(y1,y2),max(y1,y2)+1):
                    coords_count_dict[(x1,y)] = coords_count_dict.get((x1,y), 0) + 1
            elif y1 == y2:
                for x in range(min(x1,x2),max(x1,x2)+1):
                    coords_count_dict[(x,y1)] = coords_count_dict.get((x,y1), 0) + 1
            elif diagonal:
                #example: 1,1 -> 3,3 or 9,7 -> 7,9
                for x in range(min(x1,x2),max(x1,x2)+1):
                    y = int((y2 - y1)/(x2 - x1) * (x - x1) + y1) # equation for line
                    coords_count_dict[(x,y)] = coords_count_dict.get((x,y), 0) + 1
    return coords_count_dict

# Part 1: Horizontal and vertical overlaps
coords = get_coords()
count_overlaps = len([v for v in coords.values() if int(v) >= 2])
print(f"At least 2 lines overlap at {count_overlaps} points horizontally and vertically.")

# Part 2: Include diagonal overlaps
coords_with_diag = get_coords(diagonal = True)
count_overlaps_diag = len([v for v in coords_with_diag.values() if int(v) >= 2])
print(f"At least 2 lines overlap at {count_overlaps_diag} points including diagonals.")
