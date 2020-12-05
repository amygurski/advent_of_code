# frozen_string_literal: true

seats = File.readlines('input.txt', chomp: true)

# Returns an array of seat ids
# The secret to this problem was realizing that a 7 bit binary number has a range of 0 to 127
# which matches the 128 rows on the plane (numbered 0 through 127) represented by 7 F||B
# Same for the 8 columns with 3 L||R
def get_seat_ids(seats)
  seat_ids = []
  seats.each do |seat|
    row = seat.match(/[FB]{7}/)[0].tr('BF', '10').to_i(2)
    col = seat.match(/[RL]{3}/)[0].tr('RL', '10').to_i(2)
    seat_ids << (row * 8) + col
  end
  seat_ids
end

# Simpler solution for part 1:
# seat_ids = seats.map { |seat| seat.tr('BFRL', '1010').to_i(2) }
# puts "The highest seat id is #{seat_ids.max}"
# By multiplying the row number by 8 we're shifting it to the left 3 (8 being the largest 3 bit binary number).
# So (row * 8) + col is actually the same as having them concatenated together.
# For example: 'BFFFBBFRRR'.tr('BFRL', '1010').to_i(2) = 567 which is the same as (70 * 8) + 7. It's binary magic.

seat_ids = get_seat_ids(seats)
puts "The highest seat id is #{seat_ids.max}"

my_seat = seat_ids.reject { |seat| seat_ids.include?(seat + 1) }.min + 1
puts "My seat id is #{my_seat}"
