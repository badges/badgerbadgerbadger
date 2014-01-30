Before do
  FileUtils.mkpath $temp_repo
end

After do
  FileUtils.remove_dir $temp_repo, :force => true
end

Before '@no-remote' do
  Git.init '/tmp/not_wow'
end

After '@no-remote' do
  FileUtils.remove_dir '/tmp/not_wow', :force => true
end

