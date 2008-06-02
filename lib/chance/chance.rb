class Chance
  attr_reader :odds, :happens
  alias :happens? :happens
  include Comparable
  
  def initialize(percent)
    @odds = percent
    @happens = @odds.to_f > Kernel.rand(100)
  end

  def of(&block)
    yield if happens?
  end

  def to_f
    odds.to_f
  end
  alias :value :to_f
  
  def to_s
    "A #{odds.to_f} percent chance"
  end

  def *(other_chance)
    Chance.new(self.odds.of(chance.odds.to_f))
  end
  
  def <=>(other_chance)
    odds.to_f <=> other_chance.to_f
  end
  
  def identical(other_chance)
    self == other_chance && self.happens? == other.happens?
  end
  alias :identical? :identical
  
end
