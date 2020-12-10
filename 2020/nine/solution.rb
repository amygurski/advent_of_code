# frozen_string_literal: true

all_numbers = File.readlines('input.txt', chomp: true).map(&:to_i)
PREAMBLE_LENGTH = 25
numbers_to_check = all_numbers[PREAMBLE_LENGTH..all_numbers.length]

first_rule_breaking_number = numbers_to_check.each_with_index do |n, i|
  preamble = all_numbers[i...PREAMBLE_LENGTH + i]
  break n unless preamble.uniq.combination(2).detect { |a, b| a + b == n }
end

puts "#{first_rule_breaking_number} is the first number that is not the sum of two of the #{PREAMBLE_LENGTH} numbers before it."

numbers_to_check.each do |n|
    
end