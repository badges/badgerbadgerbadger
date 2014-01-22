require 'thor'
require 'badger'

module Badger
  class CLI < Thor
    desc 'badge', 'Generate default badge markdown'
    def badge
      github_remote = `hub remote -v | grep github`
      @badger = Badger.new github_remote
      puts @badger.to_s
    end
  end
end