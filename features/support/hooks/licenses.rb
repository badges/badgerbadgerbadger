Before '@mit' do
  f = File.open "#{$temp_repo}/LICENSE.md", 'w'
  f.write "The MIT License (MIT)\n"
  f.close
end

Before '@apache' do
  f = File.open "#{$temp_repo}/LICENSE.md", 'w'
  f.write "Apache License\n"
  f.write "Version 2.0\n"
  f.close
end

Before '@gpl2' do
  f = File.open "#{$temp_repo}/LICENSE.md", 'w'
  f.write "GNU GENERAL PUBLIC LICENSE\n"
  f.write "Version 2\n"
  f.close
end

Before '@gpl3' do
  f = File.open "#{$temp_repo}/LICENSE.md", 'w'
  f.write "GNU GENERAL PUBLIC LICENSE\n"
  f.write "Version 3\n"
  f.close
end

Before '@doge-license' do
  f = File.open "#{$temp_repo}/LICENSE.md", 'w'
  f.write "WOW SUCH LICENSE\n"
  f.close
end