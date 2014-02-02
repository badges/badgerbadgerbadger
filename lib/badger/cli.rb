require 'badger'

module Badger
  class CLI < Thor

    desc 'badge', 'Generate badge markdown'
    long_desc File.read File.join File.dirname( __FILE__), '..', '..', 'DESC.md'

    def badge dir = '.'
      @badger = Badger.new Badger.git_remote dir

      @badger.add 'travis' if Badger.has_travis? dir
      @badger.add 'gemnasium' if Badger.has_gemfile? dir
      @badger.add 'coveralls' if Badger.has_coveralls? dir
      @badger.add 'codeclimate' if @badger.any?

      if gemspec_params = Badger.search_gemspec(dir)
        @badger.rubygem gemspec_params[:rubygem]
        gemspec_params[:licenses].each do |license_type|
          @badger.license license_type
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