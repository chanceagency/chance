require File.dirname(__FILE__) + '/../test_helper' 

class CoreExtensionsTest < Test::Unit::TestCase
  
  def test_find_percentage_from_numeric
    assert 20.percent == Percentage.new(20).value
  end
  
  def test_find_given_percentage_of_a_numeric
    assert 50.percent.of 20 == 10
  end
  
end