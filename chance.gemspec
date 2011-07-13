# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "chance/version"

Gem::Specification.new do |s|
  s.name        = "chance"
  s.version     = Chance::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Patrick Ewing"]
  s.email       = ["patrick.henry.ewing@gmail.com"]
  s.homepage    = "https://github.com/hoverbird/chance"
  s.summary     = "Programming with probability.  YAGNI certitude."
  s.description = "Chance is a little Ruby library for expressing uncertainty in your code. Maybe you always wanted to program with probability?"

  s.rubyforge_project = "chance"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
