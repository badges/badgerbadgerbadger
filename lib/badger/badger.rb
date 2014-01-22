module Badger
  class Badger
    def initialize

    end

    def github_path url
      parts = /.*github\.com.(.*)\.git/.match(url)
      parts[1]
    end

    def get_url ugly_string
      parts = ugly_string.split("\n")[0].split("\t")[1].split(' ')
      parts[0]
    end
  end
end