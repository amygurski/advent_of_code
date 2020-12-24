# frozen_string_literal: true

require './combat'

input = File.readlines('input.txt', chomp: true)

combat = Combat.new(input)

combat.play_game
