# These numbers can be identified by their segment length:
# 1: 2; 4: 4; 7: 3; 8: 7
# If the length is 5, need to check if has digits:
# cdfbe: 5, gcdfa: 2; fbcad: 3
# If the length is 6, need to check if has digits:
# cdfgeb: 6; cefabd: 9

with open("test_input.txt") as f:
    lines = [line.strip().split(" | ")[1] for line in f.readlines()]
    outputs = [line.split(" ") for line in lines]
    print(outputs)

output_values = []
sum = 0
for output in outputs:
    print(output)
    value = ''
    for segment in output:
        print(segment)
        if len(segment) == 2:
            value += '1'
        elif len(segment) == 4:
            value += '4'
        elif len(segment) == 3:
            value += '7'
        elif len(segment) == 7:
            value += '8'
        elif len(segment) == 5:
            # need to actually read in input here and tell which it is!
            if sorted(list(segment)) == sorted(list('cdfbe')):
                value += '5'
            elif sorted(list(segment)) == sorted(list('gcdfa')):
                value += '2'
            else:
                value += '3'
        else:
            # need to actually read in input here and tell which it is!
            if sorted(list(segment)) == sorted(list('cdfgeb')):
                value += '6'
            elif sorted(list(segment)) == sorted(list('cefabd')):
                value += '9'
            else:
                value += '0'
        print(value)
    output_values.append(value)
    
print(output_values)
print(f"The sum of the outputs is {sum}.")