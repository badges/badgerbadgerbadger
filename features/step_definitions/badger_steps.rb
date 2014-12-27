Given(/^git remote is "(.*?)"$/) do |url|
  d = $temp_repo
  g = Git.init d
  g.add_remote 'origin', url
end

Given(/^git remote "(.*?)" points to "(.*?)"$/) do |name, url|
  d = $temp_repo
  g = Git.init d
  g.add_remote name, url
end
