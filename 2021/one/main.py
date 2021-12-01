with open('input.txt') as f:
    depths = [int(line.strip()) for line in f]


def number_of_times(depths):
    return sum([1 for i in range(len(depths)) if depths[i] > depths[i-1]])


three_measurement_window = [(depths[i] + depths[i+1] + depths[i+2]) for i
                            in range(len(depths) - 2)]

print(f"Part 1: {number_of_times(depths)} depths are deeper than the previous depth.")
print(f"Part 2: {number_of_times(three_measurement_window)} sums are deeper than the previous sum.")
