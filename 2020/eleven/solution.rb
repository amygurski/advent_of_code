seats = File.readlines('test_input.txt', chomp: true).map(&:chars)

DIRECTIONS = [[-1,-1], [-1,0], [-1, 1], [0,1], [1,1], [1,0], [1,-1],[0,-1]]

def get_surroundings(seats, x, y)
  surroundings = []
  count = 0
  DIRECTIONS.each do |direction|
    x_pos = x + direction[0]
    y_pos = y + direction[1] 
    if y_pos >= 0 && y_pos < seats.count
      surroundings << seats[y_pos][x_pos] if (x_pos >= 0 && x_pos < seats[y_pos].count)
    end
  end
  surroundings
end

puts "#{get_surroundings(seats, 1, 0)}"
