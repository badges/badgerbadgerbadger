# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'badger/version'

Gem::Specification.new do |spec|
  spec.name          = 'badgerbadgerbadger'
  spec.version       = Badger::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['sam@pikesley.org']
  spec.description   = %q{Generate Github project badges}
  spec.summary       = %q{Generate Github project badges}
  spec.homepage      = 'https://github.com/pikesley/badger'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.18'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rspec-pride', '~> 2.3'
  spec.add_development_dependency 'cucumber', '~> 1.3'
  spec.add_development_dependency 'aruba', '~> 0.5'
  spec.add_development_dependency 'aruba-doubles', '~> 1.2'
  spec.add_development_dependency 'guard', '~> 2.3'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
  spec.add_development_dependency 'guard-cucumber', '~> 1.4'
  spec.add_development_dependency 'coveralls', '~> 0.7'
end
