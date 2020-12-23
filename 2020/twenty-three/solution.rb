require './cup_game'

input = File.readlines('input.txt', chomp:true)[0]

cup_game = CupGame.new(input)
#puts "#{cup_game.play_game}"

#cup_game.play_game
puts "The final move is #{cup_game.play_game}"