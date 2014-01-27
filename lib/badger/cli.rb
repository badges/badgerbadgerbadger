require 'thor'
require 'badger'

module Badger
  class CLI < Thor
    desc 'badge', 'Generate default badge markdown'

    def badge dir = '.'
      @badger = Badger.new Git.open(dir).remote.url
      puts @badger.to_s
    end

    default_task :badge
  end
end