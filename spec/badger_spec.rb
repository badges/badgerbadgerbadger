require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    context 'initialisation' do
      it 'should have no badges by default' do
        @badger.length.should == 0
      end
    end

    context 'get the user and repo' do
      it 'extracts from an https url' do
        @badger.github_slug.should eql('doge/wow')
      end

      it 'extracts the owner' do
        @badger.owner.should eql 'doge'
      end

      it 'extracts from an ssh url' do
        @badger = Badger.new "git@github.com:doge/wow.git"
        @badger.github_slug.should eql('doge/wow')
      end

      it 'knows that sometimes an https url has a .git suffix because REASONS' do
        @badger = Badger.new "https://github.com/doge/wow.git"
        @badger.github_slug.should eql('doge/wow')
      end
    end

    context 'service badges' do
      it 'should have a travis badge' do
        @badger.add 'travis'
        @badger[0].should == "[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)"
      end

      it 'should have a travis badge and a gemnasium badge' do
        @badger.add 'travis'
        @badger.add 'gemnasium'
        @badger[0].should == "[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)"
        @badger[1].should == "[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)"
        @badger.length.should == 2
      end

      it 'should handle an unknown service gracefully' do
        @badger.add 'doge-service'
        @badger.length.should == 0
      end
    end

    context 'licenses' do
      it 'should generate an MIT badge' do
        @badger.license 'mit'
        @badger[0].should == "[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)"
      end

      it 'should generate an Apache badge' do
        @badger.license 'apache'
        @badger[0].should == "[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)"
      end

      it 'should generate a GPL3 badge' do
        @badger.license 'gpl-3.0'
        @badger[0].should == "[![License](http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)"
      end

      it 'should be fine with multiple licenses' do
        @badger.license 'mit'
        @badger.license 'apache'
        @badger[0].should == "[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)"
        @badger[1].should == "[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)"
      end

      it 'should generate nothing for an unknown license' do
        @badger.license 'doge-license'
        @badger.length.should == 0
      end
    end

    context 'rubygems' do
      it 'should have a rubygems badge' do
        @badger.rubygem 'suchgem'
        @badger[0].should == "[![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)"
      end
    end

    context 'bonus badge' do
      it 'should have a badges badge' do
        @badger.add 'travis'
        @badger.add 'coveralls'
        @badger.bonus
        @badger[2].should == "[![Badges](http://img.shields.io/:badges-3/3-ff6799.svg)](https://github.com/pikesley/badger)"
      end
    end

    context 'output' do
      it 'should produce some lines of text' do
        @badger.add 'travis'
        @badger.add 'codeclimate'
        @badger.license 'mit'
        @badger.to_s.should ==
            %{[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
}
      end
    end

    it 'should work with a "-" in the remote name' do
      @badger = Badger.new 'https://github.com/pikesley/diabetes-dashboard.git'
      @badger.add 'travis'
      @badger[0].should == '[![Build Status](http://img.shields.io/travis/pikesley/diabetes-dashboard.svg)](https://travis-ci.org/pikesley/diabetes-dashboard)'
    end
  end
end