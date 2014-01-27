Before do
  FileUtils.mkpath '/tmp/wow_repo'
end

After do
  FileUtils.remove_dir '/tmp/wow_repo', :force => true
end