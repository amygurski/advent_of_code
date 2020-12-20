# frozen_string_literal: true

input = File.readlines('input.txt', chomp: true)

# Part 1:
# Returns the ID of the earliest bus multiplied by
# the number of minutes you'll need to wait
def find_earliest_bus(input)
  timestamp = input[0].to_i
  buses = input[1].split(',').reject { |val| val == 'x' }.map(&:to_i)

  next_departures = get_departures(buses, timestamp)

  closest_time = next_departures.values.min
  earliest_bus = next_departures.select { |_, time| time == closest_time }
  minutes_after = closest_time - timestamp

  minutes_after * earliest_bus.key(closest_time)
end

def get_departures(buses, timestamp)
  next_departures = {}
  buses.each do |bus|
    next_departures[bus] = timestamp + bus - (timestamp % bus)
  end
  next_departures
end

# Part 2:
# Returns the earliest timestamp such that all of
# the listed bus IDs depart at offsets matching their positions
# in the list
def get_first_of_sequential_buses(input)
  buses = input[1].split(',')
  timestamp = buses[0].to_i
  interval = 1
  buses.each_with_index do |bus, index|
    next if bus == 'x'

    timestamp += interval until ((timestamp + index) % bus.to_i).zero?
    interval *= bus.to_i
  end
  timestamp
end

puts "The ID of the earliest bus times the number of minutes you'll need to wait is #{find_earliest_bus(input)}."
puts "The earliest timestamp where the buses depart at offsets matching their positions is #{get_first_of_sequential_buses(input)}."
