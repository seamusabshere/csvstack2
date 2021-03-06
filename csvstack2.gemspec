# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csvstack2/version'

Gem::Specification.new do |spec|
  spec.name          = "csvstack2"
  spec.version       = Csvstack2::VERSION
  spec.authors       = ["Seamus Abshere"]
  spec.email         = ["seamus@abshere.net"]
  spec.description   = %q{Stack CSV files on top of each other. Unlike csvstack, checks column names and reorders if necessary.}
  spec.summary       = %q{Stack CSV files on top of each other. Unlike csvstack, checks column names and reorders if necessary.}
  spec.homepage      = "https://github.com/seamusabshere/csvstack2"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
