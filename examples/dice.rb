require File.expand_path(File.dirname(__FILE__) + "/../chance")

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
    rand(sides + 1).to_i
  end

  def *(other_die)
    odds * other_die.odds
  end

  def to_s
    odds.to_f
  end
end

# @d1 = Die.new(6)
# @d2 = Die.new(6)
#
# @2d6_odds = @d1.odds * @d2.odds
# puts @2d6_odds