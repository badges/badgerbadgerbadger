module Badger
  class License
    @@licenses      = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/licenses.yaml')))

    def self.badge type, owner
      type = type.downcase
      return nil unless params = @@licenses[type]

      url = params['url']
      if /%s/.match url
        url = url % owner
      end

      badge_text = type unless badge_text = params['badge_text']

      "[![License](http://%s/:license-%s-blue.svg)](%s)" % [
          Config.instance.badge_service,
          badge_text,
          url
      ]
    end

    def self.licenses
      @@licenses
    end
  end
end