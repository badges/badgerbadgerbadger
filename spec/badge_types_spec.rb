require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    after :each do
      Config.instance.reset!
    end

    context 'alternative badge types' do
      it 'appends a style parameter' do
        @badger.style 'flat-square'
        @badger.add 'issues'
        expect(@badger[0]).to eq "[![Github Issues](http://githubbadges.herokuapp.com/doge/wow/issues.svg?style=flat-square)](https://github.com/doge/wow/issues)"
      end

      it 'lets me choose a different badge type' do
        @badger.badge_type 'png'
        @badger.add 'travis'
        expect(@badger[0]).to eq '[![Build Status](http://img.shields.io/travis/doge/wow.png)](https://travis-ci.org/doge/wow)'
      end
    end
  end
end
