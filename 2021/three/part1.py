with open('input.txt') as f:
    lines = [line.strip() for line in f]

gamma_rate = ""
epsilon_rate = ""

for i in range(len(lines[0])):
    num_ones = sum([1 for char in lines if char[i]=='1'])
    gamma_rate += '1' if num_ones > len(lines)/2 else '0'
    epsilon_rate += '1' if num_ones < len(lines)/2 else '0'

power_consumption = int(gamma_rate, base=2) * int(epsilon_rate, base=2)

print(f"The power consumption is {power_consumption}.")
