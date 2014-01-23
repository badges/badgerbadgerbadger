# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'badger/version'

Gem::Specification.new do |spec|
  spec.name          = 'badgerbadgerbadger'
  spec.version       = Badger::VERSION
  spec.authors       = ['pikesley']
  spec.email         = ['sam@pikesley.org']
  spec.description   = %q{Generate ALL THE BADGES}
  spec.summary       = %q{BADGE}
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-pride'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'aruba-doubles'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-cucumber'
  spec.add_development_dependency 'coveralls'
end
