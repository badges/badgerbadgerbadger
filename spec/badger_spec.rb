require 'badger'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new
    end

    context 'should extract the user and repo' do
      it 'for a https url' do
        @badger.github_path('https://github.com/doge/wow.git').should eql('doge/wow')
      end

      it 'for an ssh url' do
        @badger.github_path('git@github.com:doge/wow.git').should eql('doge/wow')
      end
    end

    it 'should pick out the url' do
      @badger.get_url("origin\thttps://github.com/doge/wow.git (fetch)\norigin\thttps://github.com/doge/wow.git (push)\n").should eql('https://github.com/doge/wow.git')
    end
  end
end
