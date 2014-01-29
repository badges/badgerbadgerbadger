require 'yaml'

module Badger
  class Badger
    attr_reader :licenses, :badge_service

    def initialize url
      @github_slug = github_slug url
      @blacklist   = []

      @licenses = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/licenses.yaml')))
      yaml      = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/services.yaml')))
      @services = yaml['defaults']
      @extras   = yaml['extras']
      @config   = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))

      @badge_service = @config['badge_service']

      @extra_badges = []
    end

    def github_slug url
      @github_slug ||= /.*github\.com.(.*)\.git/.match(url)[1]
    end

    def owner
      @owner ||= @github_slug.split('/')[0]
    end

    def badge
      s = []
      @services.each_pair do |k, h|
        unless @blacklist.include? k.to_s
          s << "[![%s](http://%s/%s/%s.svg)](https://%s/%s)" % [
              h['alt_text'],
              @badge_service,
              h['badge_slug'],
              @github_slug,
              h['url'],
              @github_slug
          ]
        end
      end
      s += @extra_badges

      s.uniq
    end

    def license type
      @license = License.new self, type
      @extra_badges << @license.badge
    end

    def remove items
      items = [items] unless items.class.name == 'Array'
      items.each do |item|
        @services.delete item
      end
    end

    def only items
      items = [items] unless items.class.name == 'Array'
      s     = {}
      items.each do |item|
        s[item] = @services[item]
      end

      @services = s
    end

    def also items
      items = [items] unless items.class.name == 'Array'
      s     = ''
      items.each do |item|
        if @licenses[item]
          @license = License.new self, item
          s << @license.badge
        end
        @extra_badges << s
      end
    end

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
      badge.each do |b|
        b
      end
    end
  end
end