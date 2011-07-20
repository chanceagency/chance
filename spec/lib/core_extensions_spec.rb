require File.dirname(__FILE__) + '/../spec_helper'

describe "Extensions to core classes;" do

  context "Kernel" do
    describe "maybe" do
      it "returns true or false when called with no args" do
        [true, false].should include maybe
      end

      it "executes a block of code half the time it's passed in" do
        @times_called = 0
        1000.times do
          maybe do
            @times_called += 1
          end
        end

        @times_called.should be > 1, "Odds are 1 in 1000 this fails"
        @times_called.should be < 1000, "Odds are 1 in 1000 this fails"
      end
    end

  end

  context "Numeric" do
    it "adds a #percent method to Numerics, returning Percentage" do
      20.percent.should == Percentage.new(20)
      20.0.percent.should == Percentage.new(20)
    end

    it "percentages work as expected" do
      50.percent.of(20).should == 10
    end

  end

  context "String" do
    describe "#odds" do
      it "splits a string on :, returning a Percentage" do
        "100:1".odds.should == 1.percent
      end

      it "splits a string on -, returning a Percentage" do
        "2-1".odds.should == 50.percent
      end

      it "raises an ArgumentError when not correctly delimited" do
        message = /You must express odds like 2:1 or 2-1/
        lambda {"2 to 1".odds}.should raise_error(ArgumentError, message)
        lambda {"2,1".odds}.should raise_error(ArgumentError, message)
        lambda {"2:1:2".odds}.should raise_error(ArgumentError, message)
      end
    end

  end

  context "Array" do
    describe "#random" do
      it "returns a randomly selected element" do
        a = [1,2,3]
        a.should include a.random
      end
    end

    describe "#random_pop" do
      it "removes a randomly selected element and returns it" do
        a = [1,2,3]
        a.size.should be 3

        popped = a.random_pop
        a.size.should be 2
        a.should_not include popped
      end
    end

  end

  context "Range" do
    describe "#random" do
      it "steps through the range and returns a random element from a numeric range" do
        numeric_range = 1..10
        numeric_range.should include numeric_range.random
      end

      it "steps through the range and returns a random element from a range of strings" do
        string_range = 'a'..'z'
        string_range.should include string_range.random
      end
    end
  end

end