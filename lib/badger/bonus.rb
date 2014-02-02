module Badger
  class Bonus
    def self.badge badger
      badge_url  = 'http://%s/:badges-%d/%d-%s.svg' % [
          Config.instance.config['badge_service'],
          badger.length + 1,
          badger.length + 1,
          Config.instance.config['bonus_badge_colour']
      ]
      target_url = '%s' % [
          Config.instance.config['bonus_badge_link']
      ]

      Badger.badge 'Badges', badge_url, target_url
    end
  end
end