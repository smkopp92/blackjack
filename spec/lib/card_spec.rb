require "spec_helper"

RSpec.describe Card do
  describe ".new" do
    card = Card.new("J","♣")
    it "makes a card" do
      expect(card).to be_a(Card)
    end
    it "is the right card" do
      expect(card.rank).to eq("J")
      expect(card.suit).to eq("♣")
      expect(card.type).to eq("face")
    end
  end
end
