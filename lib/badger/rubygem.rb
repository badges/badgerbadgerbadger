module Badger
  class Rubygem
    @@config        = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))
    @@badge_service = @@config['badge_service']

    def self.badge name
      "[![Gem Version](http://%s/gem/v/%s.svg)](https://rubygems.org/gems/%s)" % [
          @@badge_service,
          name,
          name
      ]
    end
  end
end