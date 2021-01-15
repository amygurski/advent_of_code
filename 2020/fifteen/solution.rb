# frozen_string_literal: true

require './memory_game'

input = File.readlines('input.txt', chomp: true)[0].split(',').map!(&:to_i)

numbers = MemoryGame.new(input)
target_number = 2020
puts "The #{target_number}th number spoken is #{numbers.get_number_spoken(target_number)}."

numbers = MemoryGame.new(input)
target_number = 30_000_000
puts "The #{target_number}th number spoken is #{numbers.get_number_spoken(target_number)}."
