# frozen_string_literal: true

$/ = "\n\n"
answers = File.readlines('input.txt', chomp: true)

# Part One
any_yes_count = answers.map { |y| y.gsub(/\n/, '').chars.to_a.uniq.count }.reduce(:+)
puts "At least one passenger answered 'yes' to a given question in their group #{any_yes_count} times."

# Part Two
all_yes_count = 0
answers_array = answers.map { |s| s.split(/\n/) }
answers_array.each do |group|
  char_count_hash = group.join('').chars.sort.chunk(&:itself).map { |k, v| [k, v.count] }.to_h
  all_yes_count += char_count_hash.select { |_, v| v == group.count }.count
end

puts "All passengers in their group answered 'yes' to a given question #{all_yes_count} times."
