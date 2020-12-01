expenses = File.readlines('input.txt').map(&:to_i)

def find_two(expenses)
  pair = expenses.combination(2).find { |x, y| x + y == 2020 }
  puts "#{pair} sums to 2020 so the first solution is #{pair.first * pair.last}."
end

def find_three(expenses)
  triplet = expenses.combination(3).find { |x, y, z| x + y + z == 2020 }
  puts "#{triplet} sums to 2020 so the second solution is #{triplet.inject(:*)}."
end

find_two(expenses)
find_three(expenses)
