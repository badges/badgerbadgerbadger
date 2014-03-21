module Badger
  class Service
    def self.badge name, github_slug
      return nil unless params = Config.instance.services[name]
      params = Config.instance.services[name]

      scheme = params['scheme'] ||= 'http'
      case params['offers_svg']
        when true
          base_url = '%s://%s' % [
              scheme,
              params['url_path']
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

      Badger.badge params['alt_text'], badge_url, target_url
    end
  end
end