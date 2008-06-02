class Percentage  
  attr_reader :value
  def initialize(value)
    @value = value
  end
  
  def of(number)
    number * (value / 100.0)
  end
  
  def chance
    Chance.new(self)
  end

  def to_f
    @value.to_f
  end
  
  def to_s
    @value.to_f.to_s
  end
end
