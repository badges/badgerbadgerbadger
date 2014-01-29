module Badger
  class License
    def initialize badger, type
      @badger = badger
      @type   = type.downcase
    end

    def badge
      return nil unless config = @badger.licenses[@type]

      @url   = config['url']
      if /%s/.match @url
        @url = @url % @badger.owner
      end

      badge_text = @type unless badge_text = config['badge_text']

      s = "[![License](http://%s/:license-%s-blue.svg)](%s)" % [
          @badger.badge_service,
          badge_text,
          @url
      ]

      s
    end
  end
end