require 'yaml'
require 'singleton'

module Badger
  class Config

    include Singleton

    def initialize
      @config = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))
    end

    def badge_service
      @config['badge_service']
    end
  end
end