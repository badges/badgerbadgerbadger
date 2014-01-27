require 'thor'
require 'badger'

module Badger
  class CLI < Thor
    desc 'badge', 'Generate badge markdown'
    long_desc <<-LONGDESC
Generates badges for Github READMEs. The default services are

    * Travis-ci

    * Code Climate

    * Coveralls

    * Gemnasium

Extra badges: currently only one extra badge is supported, a link to the MIT license from here: https://github.com/remy/mit-license, e.g.

  [![License](http://b.adge.me/:license-mit-blue.svg)](http://doge.mit-license.org)


    LONGDESC
    option :not, desc: 'Exclude these services (comma-separated list)'
    option :only, desc: 'Generate for *only* these services (comma-separated list)'
    option :also, desc: 'Include this extra service (currently only \'mit\')'

    def badge dir = '.'
      f = File.open '/tmp/wtf', 'w'
      f.write options

      @badger = Badger.new Git.open(dir).remote.url
      @badger.remove options[:not].split(',') if options[:not]
      @badger.only options[:only].split(',') if options[:only]
      @badger.also options[:also].split(',') if options[:also]

      puts @badger.to_s
    end

    default_task :badge
  end
end