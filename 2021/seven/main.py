def get_cheap_fuel(i):
    ''' List of fuel needed to align to each position.
        For cheap fuel, each crab movement costs 1 fuel.'''
    return [abs(position - i) for position in CRAB_POSITIONS]

def get_expensive_fuel(i):
    ''' List of fuel needed to align to each position.
        For expensive fuel, each change of 1 step in horizontal
        position costs 1 more unit of fuel than the last.'''
    return [(abs(position-i)*(1 + abs(position-i)))//2 for position in CRAB_POSITIONS]

def calculate_min_fuel(fuel_type="cheap"):
    '''Returns the min fuel needed for the
    crabs to align in a horizontal position.'''

    fuel_per_position = {}

    for i in range(min(CRAB_POSITIONS), max(CRAB_POSITIONS)+1):
        if fuel_type == "cheap":
            fuel_needed = sum(get_cheap_fuel(i))
        else:
            fuel_needed = sum(get_expensive_fuel(i))
        fuel_per_position[i] = fuel_needed
    return min(fuel_per_position.values())

with open("input.txt") as f:
    CRAB_POSITIONS = [int(i) for i in f.readline().split(",")]

min_fuel = calculate_min_fuel()
print(f"They need a minimum of {min_fuel} fuel to align.")

min_expensive_fuel = calculate_min_fuel(fuel_type = "expensive")
print(f"They need a minimum of {min_expensive_fuel} fuel to align if it's expensive.")
