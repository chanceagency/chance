require File.dirname(__FILE__) + '/../test_helper' 

class PercentageTest < Test::Unit::TestCase
  def test_create_from_integer
    assert_equal 20, Percentage.new(20).value
  end
  
  def test_create_from_float
    assert_equal 20.0, Percentage.new(20.0).value
  end
  
  def test_create_chance_from_percent
    assert Percentage.new(20).chance.kind_of? Chance
  end
  
end