# frozen_string_literal: true

seats = File.readlines('input.txt', chomp: true).map(&:chars)

DIRECTIONS = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1]].freeze

def get_surroundings(seats, x_index, y_index)
  surroundings = []
  DIRECTIONS.each do |direction|
    x_pos = x_index + direction[0]
    y_pos = y_index + direction[1]
    if y_pos >= 0 && y_pos < seats.count
      surroundings << seats[y_pos][x_pos] if x_pos >= 0 && x_pos < seats[y_pos].count
    end
  end
  surroundings
end

def get_seat_map(seats)
  new_seat_map = Array.new(seats.count) { Array.new(seats[0].count) }
  need_to_repeat = false
  seats.each_with_index do |row_array, y_index|
    row_array.each_with_index do |seat, x_index|
      surroundings = get_surroundings(seats, x_index, y_index)
      new_seat_map[y_index][x_index] = get_seat_status(seat, surroundings)
      need_to_repeat = true if new_seat_map[y_index][x_index] != seats[y_index][x_index]
    end
  end
  [need_to_repeat, new_seat_map]
end

def get_seat_status(seat, surroundings)
  if seat == 'L' && !surroundings.include?('#')
    '#'
  elsif seat == '#' && surroundings.count('#') >= 4
    'L'
  else
    seat
  end
end

need_to_repeat = true
need_to_repeat, seats = get_seat_map(seats) while need_to_repeat

puts "There are #{seats.join(',').count('#')} occupied seats."
