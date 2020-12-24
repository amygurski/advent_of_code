# frozen_string_literal: true

require './memory_game'

input = File.readlines('input.txt', chomp: true)[0].split(',').map!(&:to_i)

def get_number_spoken(input, numbers, target_number)
  input.each_with_index { |n, i| numbers.add_spoken(n, i + 1) }
  last_spoken = input.last
  counter = input.length + 1
  while counter <= target_number
    if numbers.spoken?(last_spoken)
      last_spoken = if numbers.spoken[last_spoken].length == 1
                      0
                    else
                      (numbers.spoken[last_spoken][-1] - numbers.spoken[last_spoken][-2])
                end
    end
    numbers.add_spoken(last_spoken, counter)
    counter += 1
  end
  numbers.spoken.detect { |_x, y| y.include?(target_number) }.first
end

numbers = MemoryGame.new
target_number = 2020
puts "The #{target_number}th number spoken is #{get_number_spoken(input, numbers, target_number)}."

numbers = MemoryGame.new
target_number = 30_000_000
puts "The #{target_number}th number spoken is #{get_number_spoken(input, numbers, target_number)}."
