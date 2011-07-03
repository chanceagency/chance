require 'bundler'
Bundler.require(:default, :examples)

require 'rspec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib/chance'))
Dir[File.expand_path(File.join(File.dirname(__FILE__),'..', 'lib', 'chance', '**', '*.rb'))].each do |f|
  require f
end
