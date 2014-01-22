require 'badger'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "origin\thttps://github.com/doge/wow.git (fetch)\norigin\thttps://github.com/doge/wow.git (push)\n"
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

    it 'should generate a badge list' do
      @badger.badge[0].should match /\[\!\[Build Status\]\(http:\/\/b.adge.me\/travis\/doge\/wow.svg\)\]\(https:\/\/travis-ci.org\/doge\/wow\)/
      @badger.badge[1].should match /\[\!\[Coverage Status\]\(http:\/\/b.adge.me\/coveralls\/doge\/wow.svg\)\]\(https:\/\/coveralls.io\/r\/doge\/wow\)/
      @badger.badge[2].should match /\[\!\[Dependency Status\]\(http:\/\/b.adge.me\/gemnasium\/doge\/wow.svg\)\]\(https:\/\/gemnasium.com\/doge\/wow\)/
      @badger.badge[3].should match /\[\!\[Code Climate\]\(http:\/\/b.adge.me\/codeclimate\/github\/doge\/wow.svg\)\]\(https:\/\/codeclimate.com\/doge\/wow\)/
    end
  end
end
