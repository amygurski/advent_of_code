# frozen_string_literal: true

# Memory game
class MemoryGame
  attr_reader :spoken

  def initialize
    @spoken = {}
  end

  def spoken?(number)
    @spoken[number]&.any?
  end

  def add_spoken(number, position)
    @spoken[number] ||= []
    @spoken[number] << position
  end
end
