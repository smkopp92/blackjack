require "spec_helper"
RSpec.describe Hand do
  card1 = Card.new("J","♣")
  card2 = Card.new("K","♣")
  hand = Hand.new([card1,card2])
  describe ".new" do
    it "it is a hand" do
      expect(hand).to be_a(Hand)
    end
  end
  describe "#score" do
    it "shows the right score" do
      expect(hand.best_score).to eq(20)
    end
    it "does not accept the wrong score" do
      expect(hand.best_score).to_not eq(19)
      expect(hand.best_score).to_not eq(15)
      expect(hand.best_score).to_not eq(12)
      expect(hand.best_score).to_not eq(10)
    end
  end
end
