class ChanceCase
  attr_reader :outcome

  def self.test(&block)
  	puts 'Here goes:'
  	case block.arity
  		when 0
  			yield
  		when 1
  			yield 'one'
  		when 2
  			yield 'one', 'two'
  		when 3
  			yield 'one', 'two', 'three'
  	end
  	puts 'Done!'
  end

end
