module Kernel

  def maybe(percent = 50.percent, &block)
    if block_given?
      percent.chance.of &block
    else
      percent.chance.happens?
    end
  end

end

class Numeric
  def percent
    Percentage.new(self)
  end

  def reduce_by(percentage = 50.percent, &block)
    block ||= Proc.new {|number| number.small?}
    return self if block.call(self)
    reduced_to = self
    until block.call(reduced_to)
      reduced_to = reduced_to.reduce_to(percentage)
    end
    Integer(reduced_to)
  end
  alias_method :reduce, :reduce_by
end

class String
  def odds
    raise ArgumentError.new "You must express odds like 2:1 or 2-1" unless match /^[0-9]+(:|-)[0-9]+$/
    first, second = *split($1).map {|string| string.to_f}
    Percentage.new((second / first) * 100)
  end
end

class Array
  def random
    self[rand(length)]
  end

  def pick(percent)
    picks, percentage = [], percent.of(length).round
    while picks.length < percentage
      picks << random
      picks.uniq!
    end
    picks
  end

  def pick_about(percentage)
    select {|element| percentage.chance.happens? }
  end

end

class Range
  def random
    step_to, i = rand(count), 0

    step do |obj|
      return obj if i == step_to
      i += 1
    end
  end
end