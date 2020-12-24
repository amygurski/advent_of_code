# frozen_string_literal: true

instructions = File.readlines('input.txt', chomp: true)
accumulator = 0
current_index = 0

def calc_accumulator(instruction, accumulator)
  operator = instruction[4]
  operand = instruction.slice(5, instruction.length).to_i
  return accumulator + operand if operator == '+'

  accumulator - operand
end

def calc_jump(instruction, index)
  operator = instruction[4]
  operand = instruction.slice(5, instruction.length).to_i
  move_location = if operator == '+'
                    index + operand
                  else
                    index - operand
                  end
  move_location
end

until instructions.all? 'complete'
  instruction = instructions[current_index]
  break accumulator if instruction == 'complete'

  operation = instruction[0..2]

  if operation == 'acc'
    accumulator = calc_accumulator(instruction, accumulator)
    next_index = current_index + 1
  elsif operation == 'jmp'
    next_index = calc_jump(instruction, current_index)
  else
    next_index = current_index + 1
  end
  instruction.replace 'complete'
  current_index = next_index
end

puts "The value in the accumulator is #{accumulator}."
