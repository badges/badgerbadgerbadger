require 'yaml'

module Badger
  class Badger < Array
#    attr_reader :licenses, :badge_service
    attr_reader :github_slug, :owner

    def initialize url
      @url = url
#      @blacklist   = []

#      @licenses = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/licenses.yaml')))
#      @services      = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/services.yaml')))
#      @extras   = yaml['extras']
#      @config   = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))

#      @badge_service = @config['badge_service']

#      @extra_badges = []
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

#    def badge
#      s = []
#      @services.each_pair do |k, h|
#        unless @blacklist.include? k.to_s
#          s << "[![%s](http://%s/%s/%s.svg)](https://%s/%s)" % [
#              h['alt_text'],
#              @badge_service,
#              h['badge_slug'],
#              @github_slug,
#              h['url'],
#              @github_slug
#          ]
#        end
#      end
#      s += @extra_badges
#
#      s.uniq
#    end

#    def license type
#      @license = License.new self, type
#      @extra_badges << @license.badge
#    end

#    def remove items
#      items = [items] unless items.class.name == 'Array'
#      items.each do |item|
#        @services.delete item
#      end
#    end

#    def only items
#      items = [items] unless items.class.name == 'Array'
#      s     = {}
#      items.each do |item|
#        s[item] = @services[item]
#      end

#      @services = s
#    end

#    def also items
#      items = [items] unless items.class.name == 'Array'
#      s     = ''
#      items.each do |item|
#        if @licenses[item]
#          @license = License.new self, item
#          s << @license.badge
#        end
#        @extra_badges << s
#      end
#    end

    def gemspec lines
      rg      = ''
      rubygem = (lines.select { |l| /\.name\s/.match l })[0].split(/\s/)[-1][1..-2]
      rg << "[![Gem Version](http://%s/gem/v/%s.svg)](https://rubygems.org/gems/%s)" % [
          @badge_service,
          rubygem,
          rubygem
      ]

      @extra_badges << rg

      spec_license = (lines.select { |l| /license/.match l })[0].split(/\s/)[-1][1..-2]

      @licenses.each_pair do |k, v|
        if /#{k}/im.match spec_license
          @license = License.new self, spec_license
        end
      end

      @extra_badges << @license.badge
    end

    def to_s
      s = ''
      self.each do |badge|
        s << badge
        s << "\n"
      end

      s
    end
  end
end