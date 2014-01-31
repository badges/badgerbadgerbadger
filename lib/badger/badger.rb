module Badger
  class Badger < Array
    attr_reader :github_slug, :owner

    def initialize url
      @url = url
    end

    def github_slug
      @github_slug ||= /.*github\.com.(.*)\.git/.match(@url)[1]
    end

    def owner
      @owner ||= github_slug.split('/')[0]
    end

    def add service
      self << Service.badge(service, github_slug)
      self.delete nil
    end

    def license type
      self << License.badge(type, owner)
      self.delete nil
    end

    def rubygem name
      self << Rubygem.badge(name)
    end

    def bonus
      self.uniq!

      badge_url = 'http://%s/:badges-%d/%d-%s.svg' % [
          Config.instance.config['badge_service'],
          self.length + 1,
          self.length + 1,
          Config.instance.config['bonus_badge_colour']
      ]
      target_url = 'http://%s' % Config.instance.config['badge_service
']
      self << Badger.badge('Badges', badge_url, target_url)
    end

    def to_s
      self.uniq!

      s = ''
      self.each do |badge|
        s << badge
        s << "\n"
      end

      s
    end
  end
end