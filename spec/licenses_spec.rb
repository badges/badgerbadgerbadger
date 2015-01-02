require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    after :each do
      Config.instance.reset!
    end

    context 'licenses' do
      it 'generates an MIT badge' do
        @badger.license 'mit'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)"
      end

      it 'generates an Apache badge' do
        @badger.license 'apache'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)"
      end

      it 'generates a GPL3 badge' do
        @badger.license 'gpl-3.0'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)"
      end

      it 'is fine with multiple licenses' do
        @badger.license 'mit'
        @badger.license 'apache'
        expect(@badger[0]).to eq "[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)"
        expect(@badger[1]).to eq "[![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)"
      end

      it 'generates nothing for an unknown license' do
        @badger.license 'doge-license'
        expect(@badger.length).to eq 0
      end
    end
  end
end
