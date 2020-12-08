# frozen_string_literal: true

TARGET_COLOR = 'shiny gold'
rules = File.readlines('input.txt', chomp: true)

# Returns hash of color and quantity for given bag content
def divide_content(content)
  return {} if content.include? 'no other bags'

  {
    'color' => content[/(\w+\s\w+)\sbag/, 1],
    'quantity' => content[/\d+/, 0]
  }
end

# Returns hash where each rule is divided into the bag color with an array of contents.
# The contents are split up into array by bag color and quantity.
# For example:
# File input of:
#   "pale gray bags contain 5 dim maroon bags.
#   dim tan bags contain 5 clear blue bags, 1 wavy bronze bag."
# Returns:
#   {
#     "pale gray"=>[{"color"=>"dim maroon", "quantity"=>"5"}],
#     "dim tan"=>[{"color"=>"clear blue", "quantity"=>"5"}, {"color"=>"wavy bronze", "quantity"=>"1"}]
#   }
def format_bags_with_contents(rules)
  bags = {}
  rules.each do |rule|
    bag = rule[/(^\w+\s\w+)\sbags/, 1]
    bag_contents = rule.split('contain')[1].split(',')
    bags[bag] = bag_contents.map do |content|
      divide_content(content)
    end
  end
  bags
end

# Returns array of all unique possible bag colors where
# the bag can contain the target bag color OR one of the bags
# inside a bag can contain the target bag color
def bags_containing_color(bags, color = TARGET_COLOR)
  possible_bag_color = []
  bags.each do |bag, contents|
    contents.reject(&:empty?).each do |content|
      if content['color'] == color
        possible_bag_color << bag
        possible_bag_color.concat bags_containing_color(bags, bag)
      end
    end
  end
  possible_bag_color.uniq
end

# Returns the total number of bags required inside the TARGET_COLOR bag
# due to all the crazy rules
def total_individual_bags(bags, color = TARGET_COLOR)
  total = 1
  bags[color].each do |content|
    total += content['quantity'].to_i * total_individual_bags(bags, content['color']) unless content.empty?
  end
  total
end

# Part One
bags = format_bags_with_contents(rules)
total_possible_bag_colors = bags_containing_color(bags).size
puts "#{total_possible_bag_colors} bag colors can eventually contain at least one #{TARGET_COLOR} bag."

# Part Two
puts "#{total_individual_bags(bags) - 1} individual bags are required inside the single #{TARGET_COLOR} bag."
