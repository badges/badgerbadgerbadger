module Badger
  def Badger.has_travis? dir
    ((Dir.entries dir).select { |i| '.travis.yml' == i }).any?
  end

  def Badger.has_gemfile? dir
    gemfiles(dir).any?
  end

  def Badger.has_coveralls? dir
    lines = []
    gemfiles(dir).each do |gemfile|
      lines += File.readlines(File.join(dir, gemfile))
    end

    lines.grep(/coveralls/).any?
  end

  def Badger.gemfiles dir
    targets = []
    targets += (Dir.entries dir).select { |i| /Gemfile/.match i }
    targets += (Dir.entries dir).select { |i| /gemspec/.match i }
    targets
  end
end