require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    after :each do
      Config.instance.reset!
    end

    context 'service badges' do
      it 'has a travis badge' do
        @badger.add 'travis'
        expect(@badger[0]).to eq "[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)"
      end

      it 'has a travis badge and a gemnasium badge' do
        @badger.add 'travis'
        @badger.add 'gemnasium'
        expect(@badger[0]).to eq "[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)"
        expect(@badger[1]).to eq "[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)"
        expect(@badger.length).to eq 2
      end

      it 'has a dependencyci badge' do
        @badger.dependencyci
        expect(@badger[0]).to eq "[![Dependency CI](http://dependencyci.com/github/doge/wow/badge)](http://dependencyci.com/github/doge/wow)"
        expect(@badger.length).to eq 1
      end

      it 'handles an unknown service gracefully' do
        @badger.add 'doge-service'
        expect(@badger.length).to eq 0
      end
    end
  end
end
