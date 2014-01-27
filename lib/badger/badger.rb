require 'yaml'

module Badger
  class Badger
    def initialize url
      @github_slug = github_slug url
      @blacklist   = []

      yaml = YAML.load(
          File.open(
              File.join(
                  File.dirname(__FILE__),
                  '..',
                  '..',
                  'config/services.yaml'
              )
          )
      )['services']

      @services     = yaml['defaults']
      @extras       = yaml['extras']
      @extra_badges = []
    end

    def github_slug url
      @github_slug ||= /.*github\.com.(.*)\.git/.match(url)[1]
    end

    def badge
      s = []
      @services.each_pair do |k, h|
        unless @blacklist.include? k.to_s
          s << "[![%s](http://b.adge.me/%s/%s.svg)](https://%s/%s)" % [
              h['alt_text'],
              h['badge_slug'],
              @github_slug,
              h['url'],
              @github_slug
          ]
        end
      end
      s += @extra_badges

      s
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

        if @extras[item]
          e = @extras[item]

          owner = @github_slug.split('/')[0]
          t     = e['url'] % owner
          s     = "[![%s](http://b.adge.me/%s)](%s)" % [
              e['alt_text'],
              e['badge_path'],
              t
          ]
        end

        @extra_badges << s
      end
    end

    def to_s
      badge.each do |b|
        b
      end
    end
  end
end