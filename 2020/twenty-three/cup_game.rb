class CupGame

  attr_accessor :input

  def initialize(input)
    @cups = input.split('').map(&:to_i)
    @current_cup = @cups[0]
  end

  def play_game
    10.times do
      puts "Cups is #{@cups}"
      make_move
    end
    @cups
  end

  def make_move
    picked_up_cups = pick_up
    puts "Picked up cups: #{picked_up_cups}"
    destination_cup = get_destination_cup(picked_up_cups)
    puts "Destination cup: #{destination_cup}"
    insert_cups(destination_cup, picked_up_cups)
    get_current_cup
    puts "New Current cupt is #{@current_cup}"
  end

  def get_current_cup
    start_index = @cups.index(@current_cup) + 1
    @current_cup = @cups.rotate(start_index)[0]
  end

  def pick_up
    start_index = @cups.index(@current_cup) + 1
    pick_up = @cups.rotate(start_index)[0..2]
  end

  def get_destination_cup(pick_up)
    possible_destinations = @cups.reject {|v| pick_up.any?(v)}
    smaller_numbers = possible_destinations.find_all { |v| v <= (@current_cup - 1) }
    if smaller_numbers.empty?
      destination_cup = possible_destinations.max 
    else
      destination_cup = smaller_numbers.max
    end
    destination_cup
  end

  def insert_cups(destination_cup, cups_to_insert)
    @cups.reject! {|v| cups_to_insert.any?(v)}
    insert_index = @cups.index(destination_cup) + 1
    #destination_index = @cups.find_index{ |i| i == destination_cup } + 1
    puts "Insert index: #{insert_index}"
    @cups.insert(insert_index, cups_to_insert).flatten!
  end
end