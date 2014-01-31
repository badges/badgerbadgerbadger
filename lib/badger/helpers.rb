module Badger

  def Badger.is_repo? dir
    begin
      Git.open(dir)
    rescue ArgumentError
      puts 'Run this from inside a git repo'
      exit 1
    end
  end

  def Badger.git_remote dir
    remote = is_repo?(dir).remote.url
    if remote.nil?
      puts 'This repo does not appear to have a github remote'
      exit 2
    end

    remote
  end

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

    if spec_file
      params            = {}
      gs                = File.readlines(File.join(dir, spec_file))
      params[:rubygem]  = eval (gs.grep /\.name /)[0].sub('spec.', '')
      l                 = eval (gs.grep /licenses?/)[0].sub('spec.', '')
      params[:licenses] = l.class.name == 'Array' ? l : [l]
    end

    params || nil
  end
end