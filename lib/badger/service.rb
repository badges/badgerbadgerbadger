module Badger
  class Service
    def self.badge name, github_slug
      return nil unless params = Config.instance.services[name]
      params = Config.instance.services[name]

      "[![%s](http://%s/%s/%s.svg)](https://%s/%s)" % [
          params['alt_text'],
          Config.instance.badge_service,
          params['badge_slug'],
          github_slug,
          params['url'],
          github_slug
      ]
    end
  end
end