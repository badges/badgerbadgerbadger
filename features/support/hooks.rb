Before do
  FileUtils.mkpath '/tmp/wow_repo'
end

After do
  FileUtils.remove_dir '/tmp/wow_repo', :force => true
end

Before '@gemspec' do
  f = File.open('/tmp/wow_repo/suchgem.gemspec', 'w')
  [
      "spec.name    'suchgem'",
      "spec.license 'MIT'"
  ].each do |line|
    f.write line
    f.write "\n"
  end
  f.close
end

Before '@no-remote' do
  Git.init '/tmp/not_wow'
end

After '@no-remote' do
  FileUtils.remove_dir '/tmp/not_wow', :force => true
end

Before '@travis' do
  FileUtils.touch '/tmp/wow_repo/.travis.yml'
end

Before '@coveralls' do
  f = File.open '/tmp/wow_repo/Gemfile', 'w'
  f.write 'gem "coveralls"'
  f.close
end

Before '@mit' do
  f = File.open '/tmp/wow_repo/LICENSE.md', 'w'
  f.write "The MIT License (MIT)\n"
  f.close
end

Before '@apache' do
  f = File.open '/tmp/wow_repo/LICENSE.md', 'w'
  f.write "Apache License\n"
  f.write "Version 2.0\n"
  f.close
end

Before '@gpl2' do
  f = File.open '/tmp/wow_repo/LICENSE.md', 'w'
  f.write "GNU GENERAL PUBLIC LICENSE\n"
  f.write "Version 2\n"
  f.close
end

Before '@gpl3' do
  f = File.open '/tmp/wow_repo/LICENSE.md', 'w'
  f.write "GNU GENERAL PUBLIC LICENSE\n"
  f.write "Version 3\n"
  f.close
end