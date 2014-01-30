require 'thor'
require 'badger'

module Badger
  class CLI < Thor

    desc 'badge', 'Generate badge markdown'
    long_desc <<-LONGDESC
Generates badges for Github READMEs. The default services are:

    * Travis-ci

    * Code Climate

    * Coveralls

    * Gemnasium

If a gemspec is found, the following badges will also be generated:

    * [License] badge, linking to the appropriate license

    * [Gem version] badge, linking to rubygems.org

If a license file is found, a license badge will be generated. Currently supported licenses are:

    * MIT

    * Apache

    * GPL-2

    * GPL-3

The supported license details are in https://github.com/pikesley/badger/blob/master/config/licenses.yaml, if you're using a different license, send a PR! And if your gemspec license conflicts with your LICENSE file, you should probably fix that.


    LONGDESC

    def badge dir = '.'
      begin
        @g = Git.open(dir)
      rescue ArgumentError
        puts 'Run this from inside a git repo'
        exit 1
      end

      @r = @g.remote.url
      if @r.nil?
        puts 'This repo does not appear to have a github remote'
        exit 2
      end
      @badger = Badger.new @r

      @badger.add 'travis' if Badger.has_travis? dir
      @badger.add 'gemnasium' if Badger.has_gemfile? dir
      @badger.add 'coveralls' if Badger.has_coveralls? dir

      @badger.add 'codeclimate' if @badger.any?

      if gemspec_params = Badger.search_gemspec(dir)
        @badger.rubygem gemspec_params[:rubygem]
        @badger.license gemspec_params[:license]
      end

      if license_type = Badger.find_license(dir)
        @badger.license license_type
      end

      puts @badger.to_s
    end

    default_task :badge
  end
end