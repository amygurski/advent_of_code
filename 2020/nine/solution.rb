# frozen_string_literal: true

all_numbers = File.readlines('input.txt', chomp: true).map(&:to_i)
PREAMBLE_LENGTH = 25

# Returns the first number that is not the sum of two of the numbers in the preamble before it.
def find_first_rule_breaker(all_numbers)
  numbers_to_check = all_numbers[PREAMBLE_LENGTH..all_numbers.length]
  numbers_to_check.each_with_index do |n, i|
    preamble = all_numbers[i...PREAMBLE_LENGTH + i]
    break n unless preamble.uniq.combination(2).detect { |a, b| a + b == n }
  end
end

# Returns an array of contiguous numbers from the input that sum to the target sum
def number_set(all_numbers, target_sum)
  contiguous_numbers = []
  [*0...all_numbers.length].combination(2).each do |a, b|
    next if all_numbers[a] > target_sum || all_numbers[b] > target_sum

    contiguous_numbers = all_numbers.values_at(a..b)
    break contiguous_numbers if contiguous_numbers.sum == target_sum
  end
  contiguous_numbers
end

first_rule_breaking_number = find_first_rule_breaker(all_numbers)
puts "#{first_rule_breaking_number} is the first number that is not the sum of two of the #{PREAMBLE_LENGTH} numbers before it."

encryption_weakness = number_set(all_numbers, first_rule_breaking_number).minmax.sum
puts "The encryption weakness is #{encryption_weakness}."
