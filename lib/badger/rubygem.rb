module Badger
  class Rubygem
    def self.badge name
      "[![Gem Version](http://%s/gem/v/%s.svg)](https://rubygems.org/gems/%s)" % [
          Config.instance.badge_service,
          name,
          name
      ]
    end
  end
end