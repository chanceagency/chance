require 'bundler'
Bundler.require(:default, :examples)

require 'rspec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib', 'chance'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'examples'))

Dir[File.expand_path(File.join(File.dirname(__FILE__),'..', 'lib', 'chance', '**', '*.rb'))].each {|f| require f }
Dir[File.expand_path(File.join(File.dirname(__FILE__),'..', 'examples', '**', '*.rb'))].each {|f| require f }
