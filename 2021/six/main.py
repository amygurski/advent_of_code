def get_starting_fish(lanternfish):
    '''Returns the starting dictionary of laternfish
    Each key is a fish internal timer and the value is the count
    of fish at that timer.'''

    lanternfish_dict = {0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0}

    for fish in lanternfish:
        lanternfish_dict[fish] += 1

    return lanternfish_dict

def calculate_lanternfish_growth(lanternfish_dict, days):
    '''Returns number of fish after specified number of days.
    Lanternfish create a new fish at 0 and their timers reset to 6.
    The new fish starts with a timer of 8.'''

    while days > 0:
        new_fish = lanternfish_dict[0]
        lanternfish_dict[7] += lanternfish_dict[0] # To make 0 become 6
        for i in range(1,len(lanternfish_dict.keys())):
            lanternfish_dict[i-1] = lanternfish_dict[i]
        lanternfish_dict[8] = new_fish
        days -= 1
    return sum(lanternfish_dict.values())

with open("input.txt") as f:
    lanternfish_list = [int(i) for i in f.readline().split(",")]

NUM_OF_DAYS = 80
starting_fish_dict = get_starting_fish(lanternfish_list)
total_fish = calculate_lanternfish_growth(starting_fish_dict, days=NUM_OF_DAYS)
print(f"After {NUM_OF_DAYS} days, there are {total_fish} fish.")

NUM_OF_DAYS = 256
starting_fish_dict = get_starting_fish(lanternfish_list)
total_fish = calculate_lanternfish_growth(starting_fish_dict, days=NUM_OF_DAYS)
print(f"After {NUM_OF_DAYS} days, there are {total_fish} fish.")
