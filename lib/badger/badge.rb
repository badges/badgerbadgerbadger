module Badger
  def Badger.badge text, badge_url, target_url
    "[![%s](%s.%s)](%s)" % [
        text,
        badge_url,
        Config.instance.config['badge_type'],
        target_url
    ]
  end
end