require "spec_helper"

RSpec.describe ".new" do
  deck = Deck.new
  it "makes 52 cards" do
    expect(deck.count).to eq(52)
  end
  it "have a deck" do
    expect(deck).to be_a(Deck)
  end
  it "is shuffled" do
    expect(deck.shuffle).to_not eq(deck)
  end
  it "pops" do
    deck.deal
    expect(deck.count).to eq(51)
  end
end
