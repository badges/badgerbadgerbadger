Given(/^git remote is "(.*?)"$/) do |url|
#  Git.stub_chain(:open, :remote, :url).with('.').and_return(url)
  d = File.join(File.dirname(__FILE__), '..', '..', 'tmp', 'aruba')
#  require 'pry'
#  binding.pry
  Dir.chdir d
  g = Git.init d
 # g = Git.open d
  g.add_remote 'origin', url
end
