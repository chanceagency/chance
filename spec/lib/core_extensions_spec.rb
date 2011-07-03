require File.dirname(__FILE__) + '/../spec_helper'

describe "Extensions to core classes;" do
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

      it "raises an ArgumentError when delimeters are not correct" do
        message = /You must express odds like 2:1 or 2-1/
        lambda {"2 to 1".odds}.should raise_error(ArgumentError, message)
        lambda {"2,1".odds}.should raise_error(ArgumentError, message)
        lambda {"2:1:2".odds}.should raise_error(ArgumentError, message)
      end
    end

  end
end
