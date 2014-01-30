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

  def Badger.find_license dir
    license_file = (Dir.entries dir).select { |i| /LICENSE/i.match i }[0]

    if license_file
      words = File.open(File.join(dir, license_file), 'r').read
      License.licenses.each_pair do |k, v|
        if /#{v['regex']}/im.match words
          return k
        end
      end
    end
  end

  def Badger.search_gemspec dir
    spec_file = (Dir.entries dir).select { |i| /gemspec/.match i }[0]
    params = nil

    if spec_file
      params = {}
      gs = File.readlines(File.join(dir, spec_file))
      params[:rubygem] = (gs.grep /\.name /)[0].split('=')[-1].strip[1..-2]
      params[:license] = (gs.grep /\.license /)[0].split('=')[-1].strip[1..-2]
    end

    params
  end
end