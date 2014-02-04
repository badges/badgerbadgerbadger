module Badger
  class Config

    include Singleton

    def initialize
      @config   = fetch_yaml 'config'
      @services = fetch_yaml 'services'
      @licenses = fetch_yaml 'licenses'
    end

    def services
      @services
    end

    def licenses
      @licenses
    end

    def config
      @config
    end

#    def badge_type= type
#      @config['badge_type'] = type
#    end

    private

    def fetch_yaml file
      YAML.load(
          File.open(
              File.join(
                  File.dirname(__FILE__),
                  '..',
                  '..',
                  'config/%s.yaml' % [
                      file
                  ]
              )
          )
      )
    end
  end
end