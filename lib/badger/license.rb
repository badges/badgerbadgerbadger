module Badger
  class License
    def self.badge type, owner
      type = type.downcase
      return nil unless params = Config.instance.licenses[type]

      target_url = params['url']
      if target_url =~ /%s/
        target_url = target_url % owner
      end

      badge_text = type unless badge_text = params['badge_text']
      badge_url  = 'http://%s/:license-%s-%s.svg' % [
          Config.instance.config['badge_service'],
          badge_text,
          Config.instance.config['license_colour']
      ]

      Badger.badge 'License', badge_url, target_url
    end

    def self.licenses
      @@licenses
    end
  end
end