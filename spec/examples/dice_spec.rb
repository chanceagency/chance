require File.dirname(__FILE__) + '/../spec_helper'

describe Die do
  it "outputs a result when rolled for a given number of sides" do
    @d6 = Die.new(6)
    (1..6).should include(@d6.roll)
  end
end