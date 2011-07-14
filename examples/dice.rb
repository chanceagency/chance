class Die
  attr_reader :sides, :odds
  def initialize(sides)
    @sides = sides
    @odds = ((1.0 / sides) * 100 ).percent.chance
  end

  def self.roll(sides)
    new(sides).odds.happens?
  end

  def roll
    rand(sides).to_i + 1
  end

  def *(other_die)
    odds * other_die.odds
  end

  def to_s
    odds.to_f
  end
end