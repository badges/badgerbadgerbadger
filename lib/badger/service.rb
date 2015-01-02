module Badger
  class Service
    def self.badge name, github_slug
      return nil unless params = Config.instance.services[name]
      params = Config.instance.services[name]

      scheme = params['scheme'] ||= 'http'

      if params['service_root']
        base_url = 'http://%s' % [
          params['service_root']
        ]
      else
        base_url = 'http://%s/%s' % [
          Config.instance.config['badge_service'],
          params['badge_slug']
        ]
      end

      badge_url = '%s/%s' % [
        base_url,
        github_slug
      ]

      target_url = 'https://%s/%s' % [
        params['url_path'],
        github_slug
      ]

      if params['suffix']
        badge_url = suffixify badge_url, params['suffix']
        target_url = suffixify target_url, params['suffix']
      end

      Badger.badge params['alt_text'], badge_url, target_url
    end

    def self.suffixify path, suffix
      '%s/%s' % [
        path,
        suffix
      ]
    end
  end
end
