require File.dirname(__FILE__) + '/../spec_helper'

describe Percentage do
  it "can be created from an Integer" do
    20.should == Percentage.new(20).value
  end

  it "can be created from a Float" do
    20.0.should == Percentage.new(20.0).value
  end

  it "is comparable to other Percentages" do
    Percentage.new(20).should == Percentage.new(20)
    Percentage.new(10).should be < Percentage.new(15)
    Percentage.new(15).should be > Percentage.new(10)
  end
end
