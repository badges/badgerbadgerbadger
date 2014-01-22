module Badger
  class Badger
    def initialize origin_list
      @github_slug = github_path(get_url(origin_list))
    end

    def github_path url
      parts = /.*github\.com.(.*)\.git/.match(url)
      parts[1]
    end

    def get_url ugly_string
      parts = /origin\s(.*)\s\(.*/.match(ugly_string)
      parts[1]
    end

    def badge
      services = {
          :travis       => {
              :alt_text   => 'Build Status',
              :url        => 'travis-ci.org',
              :badge_slug => 'travis'
          },
          :coveralls    => {
              :alt_text   => 'Coverage Status',
              :url        => 'coveralls.io/r',
              :badge_slug => 'coveralls'
          },
          :gemnasium    => {
              :alt_text   => 'Dependency Status',
              :url        => 'gemnasium.com',
              :badge_slug => 'gemnasium',
          },
          :code_climate => {
              :alt_text   => 'Code Climate',
              :url        => 'codeclimate.com/github',
              :badge_slug => 'codeclimate/github'
          }
      }

      s = []
      services.each_value do |h|
        s << "[![%s](http://b.adge.me/%s/%s.svg)](https://%s/%s)" % [
            h[:alt_text],
            h[:badge_slug],
            @github_slug,
            h[:url],
            @github_slug
        ]
      end

      s
    end

    def to_s
      badge.each do |b|
        b
      end
    end

    def apply
      readme = File.join(File.dirname(__FILE__), '/../../', 'README.md')
      lines = File.open(readme, 'r').readlines

      r = File.open readme, 'w'

      badge.each do |b|
        r.write b
        r.write "\n"
      end

      r.write "\n"

      lines.each do |line|
        r.write line
      end
    end
  end
end