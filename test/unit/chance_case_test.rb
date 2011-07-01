require File.dirname(__FILE__) + '/../test_helper'

class ChanceCaseTest < Test::Unit::TestCase

  def test_a_full_case_statement
    outcome = Chance.case(
      70.percent.chance.will {'snow'},
      20.percent.chance.will {'sleet'},
      8.percent.chance.will {'sun'},
      2.percent.chance.will {'knives'}
    )
    assert %w(rain sleet snow knives).include?(outcome)
  end

  def test_really_stacked_odds
    outcome = Chance.case(
      0.01.percent.chance.will {'rain'},
      99.99.percent.chance.will {'sleet'}
    )

    assert outcome == 'sleet'
  end

  def test_only_one_case_fires
    @count = 0
    outcome = Chance.case(
      50.percent.chance.will {@count += 1},
      50.percent.chance.will {@count += 1}
    )
    assert_equal 1, @count
  end

  def test_expected_randomness
    @heads = 0
    @tails = 0
    10_000.times do
      Chance.case(
        50.percent.chance.will {@tails += 1},
        50.percent.chance.will {@heads += 1}
      )
    end
    assert_equal 10_000, @heads + @tails
    assert (10_000 / 2 - @heads).abs < 200
  end

  def test_case_statement_raises_if_odds_less_than_100
    begin
      Chance.case(
        10.percent.chance.will {'rain'},
        20.percent.chance.will {'sleet'}
      )

      flunk('should have raised')
    rescue RuntimeError
      # nothing
    end
  end

  def test_case_statement_raises_if_odds_dont_add_to_100
    begin
      Chance.case(
        10.percent.chance.will {'rain'},
        20.percent.chance.will {'sleet'},
        90.percent.chance.will {'sleet'}
      )

      flunk('should have raised')
    rescue RuntimeError
      # nothing
    end
  end

end
