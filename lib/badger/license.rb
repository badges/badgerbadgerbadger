module Badger
  class License
    def initialize badger, type
      @badger = badger
      @type   = type
    end

    def badge
      config = @badger.licenses[@type.downcase]
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