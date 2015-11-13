class Card
  attr_reader :rank, :suit
  def initialize(rank,suit)
    @rank = rank
    @suit = suit
  end

  def type
    type = ""
    faces = ["J","Q","K"]
    if faces.include?(@rank)
      type = "face"
    elsif "A".include?(@rank)
      type = "ace"
    else
      type = "number"
    end
  end
end
