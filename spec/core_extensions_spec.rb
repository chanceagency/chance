require File.dirname(__FILE__) + '/spec_helper'

describe "Extensions to core classes" do
  it "adds a percent method to Numerics, returning Percentage" do
    20.percent.should == Percentage.new(20)
  end

  it "percentages work as expected" do
    50.percent.of(20).should == 10
  end
end
