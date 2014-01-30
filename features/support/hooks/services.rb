Before '@travis' do
  FileUtils.touch '/tmp/wow_repo/.travis.yml'
end

Before '@gemnasium' do
  FileUtils.touch '/tmp/wow_repo/Gemfile'
end

Before '@coveralls' do
  f = File.open '/tmp/wow_repo/Gemfile', 'w'
  f.write 'gem "coveralls"'
  f.close
end

Before '@codeclimate' do
  FileUtils.touch '/tmp/wow_repo/.travis.yml'
end