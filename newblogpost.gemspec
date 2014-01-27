# coding: utf-8
require File.expand_path('../lib/newblogpost/version', __FILE__)
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'newblogpost/version'

Gem::Specification.new do |gem|
  gem.authors = ["Craig Wermert"]
  gem.email = ["craig.wermert@osumc.edu"]
  gem.description = %q{Generates a new blog post in markdown.}
  gem.summary  = %q{Parses your command line input into a new post. You shouldn't use this.}
  gem.homepage = "https://bmi.osumc.edu"

  gem.files = `git ls-files`.split($\)
  gem.executables = ["newblogpost"]
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.name = "newblogpost"
  gem.require_paths = ["lib"]
  gem.add_development_dependency "bundler", "~> 1.5"
  gem.add_development_dependency "rake"
  gem.version  = Newblogpost::VERSION
end