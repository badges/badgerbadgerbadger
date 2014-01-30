module Badger
  def Badger.has_travis? dir
    ((Dir.entries dir).select { |i| '.travis.yml' == i }).any?
  end

  def Badger.has_coveralls? dir
    targets = []
    targets += (Dir.entries dir).select { |i| /Gemfile/.match i }
    targets += (Dir.entries dir).select { |i| /gemspec/.match i }
    lines   = []
    targets.each do |target|
      lines += File.readlines(File.join(dir, target))
    end

    lines.grep(/coveralls/).any?
  end

end