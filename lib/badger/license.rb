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
      s = "[![License](http://%s/:license-%s-blue.svg)](%s)" % [
          @badger.badge_service,
          @type,
          @url
      ]

      s
    end
  end
end