# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'march_hare_mock/version'

Gem::Specification.new do |spec|
  spec.name          = 'march_hare_mock'
  spec.version       = MarchHareMock::VERSION
  spec.authors       = ['Chris Blackburn']
  spec.email         = ['chris@midwiretech.com']
  spec.summary       = 'MarchHare/RabbitMQ mock class in JRuby. Useful for
    mocking MarchHare usage in test code.'
  spec.description   = spec.summary
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.platform      = 'java'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'midwire_common', '~> 0.1.11'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
