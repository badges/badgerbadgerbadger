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
      it 'should have no badges by default' do
        expect(@badger.length).to eq 0
      end
    end

    context 'get the user and repo' do
      it 'extracts from an https url' do
        expect(@badger.github_slug).to eq ('doge/wow')
      end

      it 'extracts the owner' do
        expect(@badger.owner).to eq 'doge'
      end

      it 'extracts from an ssh url' do
        @badger = Badger.new "git@github.com:doge/wow.git"
        expect(@badger.github_slug).to eq ('doge/wow')
      end

      it 'knows that sometimes an https url has a .git suffix because REASONS' do
        @badger = Badger.new "https://github.com/doge/wow.git"
        expect(@badger.github_slug).to eq ('doge/wow')
      end
    end

    context 'service badges' do
      it 'should have a travis badge' do
        @badger.add 'travis'
        expect(@badger[0]).to eq "[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)"
      end

      it 'should have a travis badge and a gemnasium badge' do
        @badger.add 'travis'
        @badger.add 'gemnasium'
        expect(@badger[0]).to eq "[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)"
        expect(@badger[1]).to eq "[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)"
        expect(@badger.length).to eq 2
      end

      it 'should handle an unknown service gracefully' do
        @badger.add 'doge-service'
        expect(@badger.length).to eq 0
      end
    end

    context 'licenses' do
      it 'should generate an MIT badge' do
        @badger.license 'mit'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)"
      end

      it 'should generate an Apache badge' do
        @badger.license 'apache'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)"
      end

      it 'should generate a GPL3 badge' do
        @badger.license 'gpl-3.0'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)"
      end

      it 'should be fine with multiple licenses' do
        @badger.license 'mit'
        @badger.license 'apache'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)"
        expect(@badger[1]).to eq "[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)"
      end

      it 'should generate nothing for an unknown license' do
        @badger.license 'doge-license'
        expect(@badger.length).to eq 0
      end
    end

    context 'rubygems' do
      it 'should have a rubygems badge' do
        @badger.rubygem 'suchgem'
        expect(@badger[0]).to eq "[![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)"
      end
    end

    context 'bonus badge' do
      it 'should have a badges badge' do
        @badger.add 'travis'
        @badger.add 'coveralls'
        @badger.bonus
        expect(@badger[2]).to eq "[![Badges](http://img.shields.io/:badges-3/3-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)"
      end
    end

    context 'github pulls' do
      it 'should have a pull-requests badge' do
        @badger.add 'pulls'
        expect(@badger[0]).to eq "[![Pending Pull-Requests](http://githubbadges.herokuapp.com/doge/wow/pulls.svg)](https://github.com/doge/wow/pulls)"
      end
    end

    context 'alternative styles' do
      it 'appends a style parameter' do
        @badger.style 'flat-square'
        @badger.add 'issues'
        expect(@badger[0]).to eq "[![Github Issues](http://githubbadges.herokuapp.com/doge/wow/issues.svg?style=flat-square)](https://github.com/doge/wow/issues)"
      end
    end

    context 'output' do
      it 'should produce some lines of text' do
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

    it 'should work with a "-" in the remote name' do
      @badger = Badger.new 'https://github.com/pikesley/diabetes-dashboard.git'
      @badger.add 'travis'
      expect(@badger[0]).to eq '[![Build Status](http://img.shields.io/travis/pikesley/diabetes-dashboard.svg)](https://travis-ci.org/pikesley/diabetes-dashboard)'
    end

    it 'should let me choose a different badge type' do
      @badger.badge_type 'png'
      @badger.add 'travis'
      expect(@badger[0]).to eq '[![Build Status](http://img.shields.io/travis/doge/wow.png)](https://travis-ci.org/doge/wow)'
    end
  end
end
