require 'badger'

module Badger
  class CLI < Thor
    desc 'version', 'Print badger version'
    def version
      puts "badger version %s" % [
          VERSION
      ]
    end
    map %w(-v --version) => :version

    desc 'badge', 'Generate badge markdown'
    long_desc File.read File.join File.dirname( __FILE__), '..', '..', 'DESC.md'
    method_option :png, :type => :boolean, :default => false, :desc => 'Generate PNG badges instead of the default SVG (because sometimes Github does caching things)'
    method_option :pulls, :type => :boolean, :default => false, :desc => 'Generate Github pull-request and issue-count badges'
    method_option :size, :type => :boolean, :default => false, :desc => 'Generate repo size badge'
    method_option :style, :type => :string, :default => nil, :desc => "Choose a different badge style (currently supported: #{Config.instance.config['valid_styles'].join ', '})"

    def badge dir = '.'
      @badger = Badger.new Badger.git_remote dir

      @badger.badge_type 'png' if options[:png]

      @badger.style options[:style] if options[:style]

      @badger.add 'travis' if Badger.has_travis? dir
      @badger.add 'gemnasium' if Badger.has_gemfile? dir
      @badger.add 'coveralls' if Badger.has_coveralls? dir
      @badger.add 'codeclimate' if @badger.any?

      @badger.add 'issues' if options[:pulls]
      @badger.add 'pulls' if options[:pulls]

      @badger.add 'size' if options[:size]

      if gemspec_params = Badger.search_gemspec(dir)
        @badger.rubygem gemspec_params[:rubygem]
        if gemspec_params[:licenses]
          gemspec_params[:licenses].each do |license_type|
          @badger.license license_type
        end
        end
      end

      if license_type = Badger.find_license(dir)
        @badger.license license_type
      end

      @badger.bonus
      puts @badger.to_s
    end

    default_task :badge
  end
end
