module Badger
  class Service
    @@services      = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/services.yaml')))
    @@config        = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))
    @@badge_service = @@config['badge_service']

    def self.badge name, github_slug
      return nil unless params = @@services[name]
      params = @@services[name]

      "[![%s](http://%s/%s/%s.svg)](https://%s/%s)" % [
          params['alt_text'],
          @@badge_service,
          params['badge_slug'],
          github_slug,
          params['url'],
          github_slug
      ]
    end
  end
end