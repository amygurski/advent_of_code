with open('input.txt') as f:
    lines = [line.strip() for line in f]

oxygen_list = lines
co2_list = lines

for i in range(len(lines[0])):
    num_ones_for_o2 = sum([1 for item in oxygen_list if item[i]=='1'])
    num_ones_for_co2 = sum([1 for item in co2_list if item[i]=='1'])

    o2_num_to_keep = '1' if num_ones_for_o2 >= len(oxygen_list)/2 else '0'
    co2_num_to_keep = '0' if num_ones_for_co2 >= len(co2_list)/2 else '1'

    if len(oxygen_list) != 1:
        oxygen_list = [item for item in oxygen_list if item[i]==o2_num_to_keep]

    if len(co2_list) != 1:
        co2_list = [item for item in co2_list if item[i]==co2_num_to_keep]

oxygen_generator = int(oxygen_list[0], base=2)
co2_generator = int(co2_list[0], base=2)

print(f"The life support rating is {oxygen_generator * co2_generator}.")
