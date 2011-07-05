class Percentage
  include Comparable

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def of(number_or_percentage)
    number_or_percentage * (value / 100.0)
  end

  def chance
    Chance.new self
  end

  def to_f
    @value.to_f
  end

  def to_s
    to_f.to_s
  end

  def <=>(other)
    value <=> other.value
  end

  def *(other)
    other_value = other.kind_of?(Numeric) ? other : other.value
    Percentage.new value * other_value
  end

end
