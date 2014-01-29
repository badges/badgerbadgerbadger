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
    option :not, desc: 'Exclude these services (comma-separated list)'
    option :only, desc: 'Generate for *only* these services (comma-separated list)'

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

      @badger.remove options[:not].split(',') if options[:not]
      @badger.only options[:only].split(',') if options[:only]
      @badger.also options[:also].split(',') if options[:also]

      spec_file = (Dir.entries dir).select { |i| /gemspec/.match i }[0]

      if spec_file
        lines = File.open(File.join(dir, spec_file), 'r').readlines
        @badger.gemspec lines
      end

      license_file = (Dir.entries dir).select { |i| /LICENSE/i.match i }[0]

      if license_file
        words = File.open(File.join(dir, license_file), 'r').read
        @badger.licenses.each_pair do |k, v|
          if /#{v['regex']}/im.match words
            @badger.license k
          end
        end
      end

      puts @badger.to_s
    end

    default_task :badge
  end
end