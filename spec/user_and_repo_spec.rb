require 'spec_helper'

module Badger
  describe Badger do
    before :each do
      @badger = Badger.new "https://github.com/doge/wow"
    end

    after :each do
      Config.instance.reset!
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
  end
end
