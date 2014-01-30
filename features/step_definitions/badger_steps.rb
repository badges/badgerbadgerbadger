Given(/^git remote is "(.*?)"$/) do |url|
  d = $temp_repo
  g = Git.init d
  g.add_remote 'origin', url
end
