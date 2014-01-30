require 'yaml'

module Badger
#  @@config = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))

  def Badger.badge_service
    config = YAML.load(File.open(File.join(File.dirname(__FILE__), '..', '..', 'config/config.yaml')))

    config['badge_service']
  end
end