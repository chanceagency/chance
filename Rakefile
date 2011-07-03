require 'bundler'
require 'rake/testtask'
require 'rspec/core/rake_task'

# Bundler.setup

desc "Run all examples"
RSpec::Core::RakeTask.new(:examples) do |spec|
  rules_engine_root = File.expand_path(File.dirname(__FILE__))
  spec.pattern = rules_engine_root + '/spec/*_spec.rb'
  spec.ruby_opts="-w"
end

task :default => :examples
