require 'thor'
require 'badger'

module Badger
  class CLI < Thor
    desc 'badge', 'Generate default badge markdown'
    def badge
      puts 'Build Status'
      github_remote = `hub remote -v | grep github`

      @badger = Badger.new github_remote
    end
  end
end