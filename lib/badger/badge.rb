module Badger
  def Badger.badge text, badge_url, target_url
    "[![%s](%s)](%s)" % [
        text,
        badge_url,
        target_url
    ]
  end
end