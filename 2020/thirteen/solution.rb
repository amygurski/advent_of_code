input = File.readlines('input.txt', chomp: true)
timestamp = input[0].to_i
buses = input[1].split(',').reject{ |val| val=='x'}.map(&:to_i)

next_departures = {}
buses.each do |bus|
  next_departures[bus] = timestamp + bus - (timestamp % bus)
end

closest_time = next_departures.values.min
earliest_bus = next_departures.select { |_, time| time == closest_time }
minutes_after = closest_time - timestamp

puts "The ID of the earliest bus times the number of minutes you'll need to wait is #{minutes_after * earliest_bus.key(closest_time)}."