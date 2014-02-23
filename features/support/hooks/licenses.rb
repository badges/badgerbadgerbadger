Before '@mit' do
  FileUtils.cp "#{$licenses_dir}/mit.md", "#{$temp_repo}/LICENSE.md"
end

Before '@apache' do
  FileUtils.cp "#{$licenses_dir}/apache.txt", "#{$temp_repo}/LICENSE.txt"
end

Before '@gpl2' do
  FileUtils.cp "#{$licenses_dir}/gpl-2.0.txt", "#{$temp_repo}/LICENSE.txt"
end

Before '@gpl3' do
  FileUtils.cp "#{$licenses_dir}/gpl-3.0.txt", "#{$temp_repo}/LICENSE.txt"
end

Before '@doge-license' do
  FileUtils.cp "#{$licenses_dir}/doge.md", "#{$temp_repo}/LICENSE.txt"
end