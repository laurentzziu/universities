# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'universities/version'

Gem::Specification.new do |spec|
  spec.name          = 'universities'
  spec.version       = Universities::VERSION
  spec.authors       = ['Florinel Gorgan']
  spec.email         = ['florin@floringorgan.com']

  spec.summary       = 'Ruby gem for Hipo/university-domains-list.'
  spec.description   = 'Ruby gem for Hipo/university-domains-list.'
  spec.homepage      = 'https://github.com/laurentzziu/universities'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'httparty'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-console'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
