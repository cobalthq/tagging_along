# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tagging_along/version'

Gem::Specification.new do |spec|
  spec.name          = "tagging_along"
  spec.version       = TaggingAlong::VERSION
  spec.authors       = ["Dennis Charles Hackethal"]
  spec.email         = ["dennis.hackethal@gmail.com"]
  spec.summary       = %q{Lightweight tagging gem}
  spec.description   = %q{Super lightweight alternative to all the other tagging gems out there.}
  spec.homepage      = "https://github.com/CrowdCurity/tagging_along"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
