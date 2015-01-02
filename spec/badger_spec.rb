require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    after :each do
      Config.instance.reset!
    end

    context 'initialisation' do
      it 'has no badges by default' do
        expect(@badger.length).to eq 0
      end
    end

    context 'rubygems' do
      it 'has a rubygems badge' do
        @badger.rubygem 'suchgem'
        expect(@badger[0]).to eq "[![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)"
      end
    end

    context 'bonus badge' do
      it 'has a badges badge' do
        @badger.add 'travis'
        @badger.add 'coveralls'
        @badger.bonus
        expect(@badger[2]).to eq "[![Badges](http://img.shields.io/:badges-3/3-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)"
      end
    end

    context 'github pulls' do
      it 'has a pull-requests badge' do
        @badger.add 'pulls'
        expect(@badger[0]).to eq "[![Pending Pull-Requests](http://githubbadges.herokuapp.com/doge/wow/pulls.svg)](https://github.com/doge/wow/pulls)"
      end
    end

    context 'output' do
      it 'produces some lines of text' do
        @badger.add 'travis'
        @badger.add 'codeclimate'
        @badger.license 'mit'
        expect(@badger.to_s).to eq(
            %{[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
}
)
      end
    end

    it 'works with a "-" in the remote name' do
      @badger = Badger.new 'https://github.com/pikesley/diabetes-dashboard.git'
      @badger.add 'travis'
      expect(@badger[0]).to eq '[![Build Status](http://img.shields.io/travis/pikesley/diabetes-dashboard.svg)](https://travis-ci.org/pikesley/diabetes-dashboard)'
    end
  end
end
