require File.dirname(__FILE__) + '/spec_helper'

describe Chance do
  before do
    @chance = 50.percent.chance
    @second_chance = 50.percent.chance
    @good_chance = 90.percent.chance
    @fat_chance = 10.percent.chance # include Sarcasm
  end

  it "should have percentage odds" do
    @chance.odds.should be_kind_of Percentage
  end

  it "should be Comparable" do
    @chance.should be > @fat_chance
    @chance.should be == @second_chance
    @chance.should be < @good_chance
  end

  context "case statement" do
    it "renders a single outcome" do
      outcome = Chance.case(
        70.percent.chance.will {'snow'},
        20.percent.chance.will {'sleet'},
        8.percent.chance.will {'sun'},
        2.percent.chance.will {'knives'}
      )
      %w(rain sleet snow knives).should include(outcome)
    end

    it "generally evaluates to the expected outcome with stacked odds" do
      outcome = Chance.case(
        0.01.percent.chance.will {'rain'},
        99.99.percent.chance.will {'sleet'}
      )
      outcome.should == 'sleet'
    end

    it "only fires a single case block" do
      @count = 0
      outcome = Chance.case(
        50.percent.chance.will {@count += 1},
        50.percent.chance.will {@count += 1}
      )
      @count.should be 1
    end

    it "generally follows expected probabilities" do
      @heads, @tails = 0, 0
      10_000.times do
        Chance.case(
          50.percent.chance.will {@tails += 1},
          50.percent.chance.will {@heads += 1}
        )
      end
      10_000.should == @heads + @tails
      (10_000 / 2 - @heads).abs.should be < 200
    end

    it "should raise if odds add to less than 100" do
      lambda {
        Chance.case(
          10.percent.chance.will {'rain'},
          20.percent.chance.will {'sleet'}
        )
      }.should raise_error
    end

    it "should raise if odds add to more than 100" do
      lambda {
        Chance.case(
          10.percent.chance.will {'rain'},
          20.percent.chance.will {'sleet'},
          90.percent.chance.will {'sleet'}
        )
      }.should raise_error
    end
  end

end