module Badger
  class DependencyCI
    def self.badge name
      badge_url = 'http://%s/github/%s/badge' % [
        'dependencyci.com',
        name
      ]

      target_url = 'http://dependencyci.com/github/%s' % [
        name
      ]

      Badger.badge 'Dependency CI', badge_url, target_url
    end
  end
end
