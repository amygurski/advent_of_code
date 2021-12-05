def get_bingo_values():
    # Read in bingo values as list of integers
    with open("input.txt") as f:
        input_list = [c for c in f.readline().strip().split(',')]

    # return bingo values split into groups of 5
    return [input_list[x:x+5] for x in range(0, len(input_list), 5)]

def get_boards():
    with open("input.txt","r") as f:
        rows = [line.strip().split() for line in f.readlines()[1:] if line.split()]
    return [rows[x:x+5] for x in range(0, len(rows), 5)]

def calculate_sum(board):
    nums = [int(item) for sublist in board for item in sublist if item != 'x']
    return sum(nums)

bingo_values = get_bingo_values()
boards = get_boards()

def column_count(board):
    transposed_board = [[row[i] for row in board] for i in range(len(board[0]))]
    for row in transposed_board:
        if row.count('x') == 5:
            print("Columns did it")
            return True
    return False

have_winner = False
for i in range(len(bingo_values)):
    # seriously need to break the following mess out into functions
    for value in bingo_values[i]:
        for board in boards:
            for row in board:
                for i, item in enumerate(row):
                    if item == value:
                        row[i] = 'x'    
                    if row.count('x') == 5 or column_count(board):
                        have_winner = True
                        sum_unmarked_nums = calculate_sum(board)
                        score = sum_unmarked_nums * int(value)
                        print(f"Board wins with score of {value} * {sum_unmarked_nums} = {score}")
                        break
                #LOLOL need to fix the following
                if have_winner: 
                    break
            if have_winner:
                break
        if have_winner: 
            break
    if have_winner:
        break
