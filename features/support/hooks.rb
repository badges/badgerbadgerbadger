Before do
  FileUtils.touch 'README.md'
  FileUtils.copy 'README.md', 'README.md.bak'
end

After do
  FileUtils.move 'README.md.bak', 'README.md'
end