# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'greed/summary/version'

Gem::Specification.new do |spec|
  spec.name          = "greed-summary"
  spec.version       = Greed::Summary::VERSION
  spec.authors       = ["Bell"]
  spec.email         = ["bell@greedlab.com"]

  spec.summary       = "generate summary for markdown."
  spec.homepage      = "https://github.com/greedlab/greed-summary"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
