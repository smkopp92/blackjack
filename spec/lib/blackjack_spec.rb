require "spec_helper"

RSpec.describe Blackjack do
  blackjack = Blackjack.new
  describe ".new" do
    it "makes the blackjack object" do
      expect(blackjack).to be_a(Blackjack)
    end
    it "has a player hand" do
      expect(blackjack.player_hand.cards).to_not eq(nil)
    end
  end
  describe "#deal_card" do
    it "deals a card to player" do
      blackjack.deal_card(blackjack.player_hand,"Player")
      expect(blackjack.player_hand).to_not eq([])
    end
  end
  describe "#card_dealt_message" do
    it "ensures dealing a card has the right message" do
      card = Card.new("J","♣")
      expect {blackjack.card_dealt_message(card,"Player")}.to output("Player was dealt J♣\n").to_stdout
    end
  end
  describe "#deal_initial_hand" do
    it "ensures dealer has two hands" do
      blackjack.deal_initial_hand
      expect(blackjack.dealer_hand.cards.length).to eq(2)
    end
  end
  describe "#prompt_for_input" do
    it "ensures that the user is prompted" do
      allow(blackjack).to receive(:gets).and_return("h")
      expect{blackjack.prompt_for_input}.to output(/Hit or stand/).to_stdout
    end
    it "ensures answer is set to hit" do
      allow(blackjack).to receive(:gets).and_return("h")
      expect(blackjack.answer).to eq("h")
    end
  end
  describe "#display_score" do
    it "outputs the dealer score in the terminal" do
      dealer_score = blackjack.dealer_hand.best_score
      expect{blackjack.display_score(blackjack.dealer_hand,"Dealer")}.to output("Dealer score: #{dealer_score}\n").to_stdout
    end
  end
  describe "#hit" do
    blackjack.hit(blackjack.player_hand,"Player")
    it "adds a card to players hand" do
      expect(blackjack.player_hand.cards.length).to eq(4)
    end
  end
  describe "#stand" do
    it "shows score" do
      dealer_score = blackjack.dealer_hand.best_score
      expect{blackjack.stand(blackjack.dealer_hand,"Dealer")}.to output("Dealer score: #{dealer_score}\n").to_stdout
    end
  end
  describe "compare_scores" do
    it "accurately compares scores" do
      card1 = Card.new("J","♣")
      card2 = Card.new("5","♣")
      card3 = Card.new("2","♣")
      blackjack.player_hand = Hand.new([card1])
      blackjack.dealer_hand = Hand.new([card2])
      expect{blackjack.compare_scores}.to output(/You win/).to_stdout
      blackjack.player_hand = Hand.new([card3])
      expect{blackjack.compare_scores}.to output(/You lose/).to_stdout
    end
  end
end
