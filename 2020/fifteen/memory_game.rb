# frozen_string_literal: true

# Memory game
class MemoryGame
  attr_accessor :input

  def initialize(input)
    @starting_numbers = input
    @spoken = {}
  end

  def spoken?(number)
    @spoken[number]&.any?
  end

  def add_spoken(number, position)
    @spoken[number] ||= []
    @spoken[number] << position
  end

  def get_number_spoken(target_number)
    @starting_numbers.each_with_index { |n, i| add_spoken(n, i + 1) }
    last_spoken = @starting_numbers.last
    counter = @starting_numbers.length + 1
    while counter <= target_number
      last_spoken = get_last_spoken(last_spoken) if spoken?(last_spoken)
      add_spoken(last_spoken, counter)
      counter += 1
    end
    @spoken.detect { |_x, y| y.include?(target_number) }.first
  end

  def get_last_spoken(last_spoken)
    return 0 if @spoken[last_spoken].length == 1

    @spoken[last_spoken][-1] - @spoken[last_spoken][-2]
  end
end
