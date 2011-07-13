require 'rake/testtask'
require 'rspec/core/rake_task'
require 'bundler'
Bundler::GemHelper.install_tasks

desc "Run all examples"
RSpec::Core::RakeTask.new(:lib) do |spec|
  rules_engine_root = File.expand_path(File.dirname(__FILE__))
  spec.pattern = rules_engine_root + '/spec/lib/*_spec.rb'
  spec.rspec_opts = ["--color", "--format", "documentation"]
  # spec.ruby_opts="-w"
end

RSpec::Core::RakeTask.new(:examples) do |spec|
  rules_engine_root = File.expand_path(File.dirname(__FILE__))
  spec.pattern = rules_engine_root + '/spec/examples/*_spec.rb'
  spec.rspec_opts = ["--color", "--format", "documentation"]
  # spec.ruby_opts="-w"
end

task :default => [:lib, :examples]