Before '@travis' do
  FileUtils.touch "#{$temp_repo}/.travis.yml"
end

Before '@gemnasium' do
  FileUtils.touch "#{$temp_repo}/Gemfile"
end

Before '@coveralls' do
  f = File.open "#{$temp_repo}/Gemfile", 'w'
  f.write 'gem "coveralls"'
  f.close
end

Before '@codeclimate' do
  FileUtils.touch "#{$temp_repo}/.travis.yml"
end