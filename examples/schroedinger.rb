require File.expand_path(File.dirname(__FILE__) + "/../chance")

class SchroedingerCat
  def initialize
    @alive = nil
  end
  def alive?
    @alive ||= maybe
  end
end

# @zombie_cat = SchroedingerCat.new
# puts "The cat is #{ "undead" if @zombie_cat.instance_variable_get(:@alive).nil? } inside the box. We just don't know its state. Let's check."
# puts "Oh em gee. The cat is #{@zombie_cat.alive ? 'alive' : 'dead' }!!"
# puts "I wonder if itwas #{@zombie_cat.alive ? 'frisky and impatient' : 'slowly decomposing' } this whole time."