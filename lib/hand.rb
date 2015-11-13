class Hand
  attr_accessor :cards
  def initialize(cards)
    @cards = cards
  end
  def best_score
    score = 0
    aces = 0
    @cards.each do |card|
      if card.type == "face"
        score += 10
      elsif card.type == "ace"
        score += 11
        aces += 1
      else
        score += card.rank.to_i
      end
    end
    while aces > 0 && score >= 21
      score -= 10
      aces -= 1
    end
    score
  end
end
