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
      if service == 'issues'
        self << Badger.badge('Github Issues', 'http://githubbadges.herokuapp.com/pikesley/githubbadges/issues', 'https://githubx.com/pikesley/githubbadges/issues')
      elsif service == 'pulls'
        self << Badger.badge('Pending Pull-Requests', 'http://githubbadges.herokuapp.com/pikesley/githubbadges/pulls', 'https://githubx.com/pikesley/githubbadges/pulls')
      else
        self << Service.badge(service, github_slug)
      end
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
