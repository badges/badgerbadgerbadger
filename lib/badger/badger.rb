require 'yaml'

module Badger
  class Badger
    def initialize url
      @github_slug = github_slug url
      @blacklist = []

      @services = YAML.load(
          File.open(
              File.join(
                  File.dirname(__FILE__),
                  '..',
                  '..',
                  'config/services.yaml'
              )
          )
      )['services']['defaults']
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

      s
    end

    def remove items
      items = [items] unless items.class.name == 'Array'
      items.each do |item|
        @services.delete item
      end
    end

    def only services
      services = [services] unless services.class.name == 'Array'
      s = {}
      services.each do |service|
        s[service] = @services[service]
      end

      @services = s
    end

    def to_s
      badge.each do |b|
        b
      end
    end
  end
end