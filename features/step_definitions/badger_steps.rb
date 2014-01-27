Given(/^git remote is "(.*?)"$/) do |url|
  d = '/tmp/wow_repo'
  g = Git.init d
  g.add_remote 'origin', url
end
