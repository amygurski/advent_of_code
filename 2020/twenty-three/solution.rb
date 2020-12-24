# frozen_string_literal: true

require './cup_game'

input = File.readlines('input.txt', chomp: true)[0]

cup_game = CupGame.new(input)

cup_game.play_game
