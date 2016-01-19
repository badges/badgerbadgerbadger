require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    after :each do
      Config.instance.reset!
    end

    context 'size badge' do
      it 'has a size badge' do
        @badger.add 'size'
        expect(@badger[0]).to eq '[![Repo Size](http://reposs.herokuapp.com/?path=doge/wow)](https://github.com/doge/wow)'
      end
    end
  end
end
