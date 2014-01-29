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

Extra badges: currently only one extra badge is supported, a link to the MIT license from here: https://github.com/remy/mit-license, e.g.

  [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)


If a gemspec is found, the following badges will also be generated:

    * [License: MIT] badge (presuming an MIT license is specified, linked as above)

    * [Gem version] badge, linking to rubygems.org

    LONGDESC
    option :not, desc: 'Exclude these services (comma-separated list)'
    option :only, desc: 'Generate for *only* these services (comma-separated list)'
    option :also, desc: 'Include this extra service (currently only \'mit\')'

    def badge dir = '.'
      @badger = Badger.new Git.open(dir).remote.url
      @badger.remove options[:not].split(',') if options[:not]
      @badger.only options[:only].split(',') if options[:only]
      @badger.also options[:also].split(',') if options[:also]

      spec_file = (Dir.entries dir).select { |i| /gemspec/.match i }[0]

      if spec_file
        lines = File.open(File.join(dir, spec_file), 'r').readlines
        @badger.gemspec lines
      end

      puts @badger.to_s
    end

    default_task :badge
  end
end