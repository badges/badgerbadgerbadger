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
      parts = ugly_string.split("\n")[0].split("\t")[1].split(' ')
      parts[0]
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
              :url        => 'codeclimate.com',
              :badge_slug => 'codeclimate/github'
          }
      }

      s = ''
      services.each_value do |h|
        s << "[![%s](http://b.adge.me/%s/%s.svg)](https://%s/%s)" % [
            h[:alt_text],
            h[:badge_slug],
            @github_slug,
            h[:url],
            @github_slug
        ]
        s << "\n"
      end

      s
    end

    def apply
      lines = File.open('README.md', 'r').readlines

      r = File.open 'README.md', 'w'

    end
  end
end