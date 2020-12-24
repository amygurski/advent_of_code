# frozen_string_literal: true

# Cup Game involving cups arranged in a circle
# They get mixed up over multiple turns and
# we predict where they will end up.
class CupGame
  attr_accessor :input

  def initialize(input)
    @cups = input.split('').map(&:to_i)
    @current_cup = @cups[0]
  end

  def play_game
    100.times do |i|
      puts "--- move #{i} ---"
      puts "cups: #{@cups}"
      make_move
    end
    puts "-- final --\ncups: #{@cups}\n\n"
    final_cup_order
  end

  private

  def make_move
    picked_up_cups = pick_up
    puts "pick up: #{picked_up_cups}"
    destination_cup = get_destination_cup(picked_up_cups)
    puts "destination: #{destination_cup}\n\n"
    insert_cups(destination_cup, picked_up_cups)
    current_cup
  end

  def current_cup
    start_index = @cups.index(@current_cup) + 1
    @current_cup = @cups.rotate(start_index)[0]
  end

  def pick_up
    start_index = @cups.index(@current_cup) + 1
    @cups.rotate(start_index)[0..2]
  end

  def get_destination_cup(pick_up)
    possible_destinations = @cups.reject { |v| pick_up.any?(v) }
    smaller_numbers = possible_destinations.find_all { |v| v <= (@current_cup - 1) }
    destination_cup = if smaller_numbers.empty?
                        possible_destinations.max
                      else
                        smaller_numbers.max
                      end
    destination_cup
  end

  def insert_cups(destination_cup, cups_to_insert)
    @cups.reject! { |v| cups_to_insert.any?(v) }
    insert_index = @cups.index(destination_cup) + 1
    @cups.insert(insert_index, cups_to_insert).flatten!
  end

  def final_cup_order
    after_one = @cups.slice(@cups.index(1) + 1, @cups.length)
    before_one = @cups.slice(0, @cups.index(1))
    order = after_one.concat before_one
    puts "The order after cup 1 is #{order.join}."
  end
end
