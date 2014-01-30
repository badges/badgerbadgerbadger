module Badger
  class License
    @@licenses      = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/licenses.yaml')))
    @@config        = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))
    @@badge_service = @@config['badge_service']

    def self.badge type, owner
      type.downcase!
      return nil unless params = @@licenses[type]

      url = params['url']
      if /%s/.match url
        url = url % owner
      end

      badge_text = type unless badge_text = params['badge_text']

      "[![License](http://%s/:license-%s-blue.svg)](%s)" % [
          @@badge_service,
          badge_text,
          url
      ]
    end
  end
end