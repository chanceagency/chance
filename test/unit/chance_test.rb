require File.dirname(__FILE__) + '/../test_helper' 

class ChanceTest < Test::Unit::TestCase
  def setup
    @chance = 50.percent.chance
    @fat_chance = 10.percent.chance
  end
  
  def test_should_have_percentage_odds
    assert @chance.odds.kind_of? Percentage
  end
  
  def test_should_be_comparable
    assert @chance > @fat_chance
  end
  
  def test_should_have_equality_method
    assert_equal 5.percent.chance, 5.percent.chance
  end
end