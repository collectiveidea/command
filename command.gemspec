# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name    = "command"
  spec.version = "1.0.0"

  spec.author      = "Steve Richert"
  spec.email       = "steve.richert@gmail.com"
  spec.description = "Command provides a simple object-oriented interface for running shell commands from Ruby."
  spec.summary     = "An object-oriented approach to shelling out"
  spec.homepage    = "https://github.com/collectiveidea/command"
  spec.license     = "MIT"

  spec.files      = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(/^spec/)

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
end
