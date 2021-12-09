# Number of segments to display the number
one = 2
four = 4
seven = 3
eight = 7

unique_segment_lengths = [2,4,3,7]

with open("input.txt") as f:
    lines = [line.strip().split(" | ")[1] for line in f.readlines()]
    outputs = [line.split(" ") for line in lines]

num_of_instances = 0
for output in outputs:
    num_of_instances += sum([1 for segment in output if len(segment) in unique_segment_lengths])
    
print(f"The digits 1, 4, 7 or 8 appear {num_of_instances} times.")
