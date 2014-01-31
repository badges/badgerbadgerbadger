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

  def Badger.spec_files dir
    (Dir.entries dir).select { |i| i =~ /gemspec/ }
  end

  def Badger.gemfiles dir
    targets = []
    targets += (Dir.entries dir).select { |i| i =~ /Gemfile/ }
    targets += spec_files dir
    targets
  end

  def Badger.find_license dir
    license_file = (Dir.entries dir).select { |i| i =~ /LICENSE/ }[0]

    if license_file
      words = File.open(File.join(dir, license_file), 'r').read
      Config.instance.licenses.each_pair do |k, v|
        if words =~ /#{v['regex']}/im
          return k
        end
      end
    end

    nil
  end

  def Badger.search_gemspec dir
    spec_file = spec_files(dir)[0]

    # I wanted to eval the gemspec but that broke *everything*
    if spec_file
      params           = {}
      gs               = File.readlines(File.join(dir, spec_file))
      params[:rubygem] = (gs.grep /\.name /)[0].split('=')[-1].strip[1..-2]
      params[:license] = (gs.grep /\.license /)[0].split('=')[-1].strip[1..-2]
    end

    params || nil
  end
end