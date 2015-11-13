require_relative "hand"
require_relative "deck"
require_relative "card"
require "pry"

class Blackjack
  attr_accessor :player_hand, :dealer_hand, :answer
  def initialize
    @player_hand = Hand.new([])
    @dealer_hand = Hand.new([])
    @deck = Deck.new
  end
  def play_game
    puts "Welcome to Blackjack!"
    puts
    deal_initial_hand
    players_turn
    puts
    puts
    dealers_turn
    compare_scores
  end

  # private

  def deal_card(hand,player)
    hand.cards << @deck.deal
  end
  def card_dealt_message(card,player)
    puts "#{player} was dealt #{card.rank}#{card.suit}"
  end
  def deal_initial_hand
    2.times do
      deal_card(@player_hand,"Player")
      deal_card(@dealer_hand,"Dealer")
    end
  end
  def prompt_for_input
    puts
    print "Hit or stand (H/S) "
    @answer = gets.chomp.downcase
    while @answer != "h" && @answer != "s"
      puts "Invalid Answer. Hit or stand (H/S)"
      @answer = gets.chomp.downcase
    end
    puts
  end
  def display_score(hand,player)
    puts "#{player} score: #{hand.best_score}"
  end
  def hit(hand,player)
    deal_card(hand,player)
    card_dealt_message(hand.cards[-1],player)
    if hand.best_score > 21
      display_score(hand,player)
      if player == "Player"
        puts "Bust! Game over..."
        exit
      else
        puts "Dealer busts, you win!"
        exit
      end
    end
  end
  def stand(hand,player)
    puts "#{player} score: #{hand.best_score}"
  end
  def players_turn
    @player_hand.cards.each do |card|
      card_dealt_message(card,"Player")
    end
    display_score(@player_hand,"Player")
    prompt_for_input
    while @answer == "h"
      hit(@player_hand,"Player")
      display_score(@player_hand,"Player")
      prompt_for_input
    end
    stand(@player_hand,"Player")
  end
  def dealers_turn
    @dealer_hand.cards.each do |card|
      card_dealt_message(card,"Dealer")
    end
    display_score(@dealer_hand,"Dealer")
    puts
    while @dealer_hand.best_score < 17
      hit(@dealer_hand,"Dealer")
      display_score(@dealer_hand,"Dealer")
      puts
    end
    puts "Dealer stands"
    puts
  end
  def compare_scores
    if @player_hand.best_score > @dealer_hand.best_score
      puts "You win!"
    else
      puts "You lose!"
      display_score(@player_hand,"Player")
      display_score(@dealer_hand,"Dealer")
    end
  end
end

#blackjack = Blackjack.new
#blackjack.play_game
