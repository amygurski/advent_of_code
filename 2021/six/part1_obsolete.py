# Replaced this big list with a dictionary for the 2nd part

def calculate_lanternfish_growth(lanternfish, days):
    while days > 0:
        lanternfish_babies = []
        for index, lantern_fish in enumerate(lanternfish):
            if lantern_fish == 0:
                lanternfish[index] = 6
                lanternfish_babies.append(8)
            else:
                lanternfish[index] -= 1
        lanternfish = lanternfish + lanternfish_babies
        days -= 1
    return len(lanternfish)

with open("input.txt") as f:
    lanternfish_list = [int(i) for i in f.readline().split(",")]

NUM_OF_DAYS = 18
total_fish = calculate_lanternfish_growth(lanternfish_list, days=NUM_OF_DAYS)
print(f"After {NUM_OF_DAYS} days, there are {total_fish} fish.")