# frozen_string_literal: true

# Combat game for 2 players played in rounds.
# Each player reveals their top card.
# The player with the highest number gets to add their card
# and their opponent's card to the bottom of their deck
# Game ends when one player's deck is exhausted and
# the winning player's score is calculated.
class Combat
  attr_accessor :input

  def initialize(input)
    @player1_cards = input[1, input.find_index('Player 2:') - 2].map(&:to_i)
    @player2_cards = input[input.find_index('Player 2:') + 1, input.length].map(&:to_i)
  end

  def play_game
    round = 0
    until @player1_cards.empty? || @player2_cards.empty?
      puts "-- Round #{round += 1} --"
      puts "Player 1's deck: #{@player1_cards.join(', ')}"
      puts "Player 2's deck: #{@player2_cards.join(', ')}"
      play_round
    end
    post_game_results
    winners_score
  end

  private

  def play_round
    p1_top_card = @player1_cards.shift
    p2_top_card = @player2_cards.shift

    puts "Player 1 plays: #{p1_top_card}"
    puts "Player 2 plays: #{p2_top_card}"

    take_cards(p1_top_card, p2_top_card)
  end

  def take_cards(p1_top_card, p2_top_card)
    if p1_top_card > p2_top_card
      puts "Player 1 wins the round!\n\n"
      @player1_cards.push(p1_top_card)
      @player1_cards.push(p2_top_card)
    else
      puts "Player 2 wins the round!\n\n"
      @player2_cards.push(p2_top_card)
      @player2_cards.push(p1_top_card)
    end
  end

  def post_game_results
    puts '== Post-game results =='
    puts "Player 1's deck: #{@player1_cards.join(', ')}"
    puts "Player 2's deck: #{@player2_cards.join(', ')}\n\n"
  end

  def winners_score
    winning_deck = if @player2_cards.empty?
                     @player1_cards
                   else
                     @player2_cards
                   end

    score = winning_deck.reverse.map.with_index { |card, i| card * (i + 1) }.inject(:+)
    puts "The winning player's score is #{score}."
  end
end
