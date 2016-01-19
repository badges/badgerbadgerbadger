module Badger
  def Badger.badge text, badge_url, target_url
    badge_url = "%s.%s" % [
      badge_url,
      Config.instance.config['badge_type']
    ] unless text == 'Repo Size'

    badge_style = Config.instance.config['badge_style']
    badge_url = "%s?style=%s" % [
      badge_url,
      badge_style
    ] if badge_style

    "[![%s](%s)](%s)" % [
        text,
        badge_url,
        target_url
    ]
  end
end
