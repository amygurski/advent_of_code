# frozen_string_literal: true

tree_map = File.readlines('input.txt', chomp: true).map(&:chars)

TREE = '#'

# Returns the number of trees encountered
# while looping through the terrain
def count_trees(tree_map, move_x, move_y)
  x = 0
  row_size = tree_map.first.size

  (0...tree_map.size).step(move_y).count do |y|
    location = tree_map.fetch(y).fetch(x % row_size)
    x += move_x
    location == TREE
  end
end

first_answer = count_trees(tree_map, 3, 1)
puts "The first time we encounter #{first_answer} trees"

multiple_slopes =
  [
    [1, 1],
    [3, 1],
    [5, 1],
    [7, 1],
    [1, 2]
  ]

second_answer = multiple_slopes.map { |x, y| count_trees(tree_map, x, y) }.inject(:*)
puts "Multiplying all the slopes together we get #{second_answer} for the 2nd answer"
