class Chance
  attr_reader :odds, :happens, :event
  alias :happens? :happens
  include Comparable
  
  # 10, 20, 70, 80
  # n = 50
  
  # 70, 20, 10
  # 0..10, 0..20, 0..100 
  
  
  def self.case(*chances)
    raise "Chances don't add to 100" unless chances.inject(0) {|sum, chance| sum + chance.to_f } == 100
    ranges = []
    chances = chances.sort_by{|c| c.to_f}
    # chances = [2,8,20,70]

    chances.each_with_index do |chance, i|
      chance = chance.to_f
      if i == 0
        range = 0..chance
      elsif i == chances.size - 1
        range = @last_chance..100
      elsif @last_chance
        range = @last_chance..chance
      end
      @last_chance = range.begin
      ranges << range
    end
    num = rand(100)
    ranges.each_with_index do |r, i|
      if r.include? num
        return chances[i].event.call
      end
    end
  end
  
  def initialize(percent)
    @odds = percent
    @happens = @odds.to_f > Kernel.rand(100)
  end

  def of(&block)
    yield if happens?
  end

  def will(&block)
    @event = block
    self
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
