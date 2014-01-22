require 'thor'
module Badger
  class CLI < Thor
    desc 'badge', 'Generate default badge markdown'
    def badge
      puts 'Build Status'
    end
  end
end