module Badger
  class Badger < Array
    attr_reader :github_slug, :owner

    def initialize url
      @url = url
    end

    def github_slug
      @github_slug ||= Badger.slug_extract @url
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
      self << Bonus.badge(self)
    end

    def badge_type type
      Config.instance.config['badge_type'] = type
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
