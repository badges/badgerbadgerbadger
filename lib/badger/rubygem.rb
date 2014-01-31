module Badger
  class Rubygem
    def self.badge name
      badge_url = 'http://%s/gem/v/%s.svg' % [
          Config.instance.config['badge_service'],
          name
      ]

      target_url = 'https://rubygems.org/gems/%s' % [
          name
      ]

      Badger.badge 'Gem Version', badge_url, target_url
    end
  end
end