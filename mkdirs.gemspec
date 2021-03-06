# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mkdirs/version'

Gem::Specification.new do |spec|
  spec.name          = "mkdirs"
  spec.version       = Mkdirs::VERSION
  spec.authors       = ["Jon-Erling Dahl", "Niclas Nilsson"]
  spec.email         = ["jon-erling@fooheads.com", "niclas@fooheads.com"]

  spec.summary       = %q{Create directory structure from YML}
  spec.homepage      = "https://github.com/fooheads/mkdirs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "colorize", "~> 0.7"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "cucumber", "~> 2.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
