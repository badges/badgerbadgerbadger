module Badger
  class Badger
    def initialize url
      @github_slug = github_slug url
    end

    def github_slug url
      @github_slug ||= /.*github\.com.(.*)\.git/.match(url)[1]
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
  end
end