Given(/^git remote is "(.*?)"$/) do |url|
  d = '/tmp/wow_repo'
  g = Git.init d
  g.add_remote 'origin', url
end

#Given(/^there is a file "(.*?)" with:$/) do |file, string|
#  f = File.open('/tmp/wow_repo/%s' % file, 'w')
#  f.write string
#end