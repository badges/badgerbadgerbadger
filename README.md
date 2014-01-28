[![Build Status](http://b.adge.me/travis/pikesley/badger.svg)](https://travis-ci.org/pikesley/badger)
[![Coverage Status](http://b.adge.me/coveralls/pikesley/badger.svg)](https://coveralls.io/r/pikesley/badger)
[![Dependency Status](http://b.adge.me/gemnasium/pikesley/badger.svg)](https://gemnasium.com/pikesley/badger)
[![Code Climate](http://b.adge.me/codeclimate/github/pikesley/badger.svg)](https://codeclimate.com/github/pikesley/badger)
[![Gem Version](http://b.adge.me/gem/v/badgerbadgerbadger.svg)](https://rubygems.org/gems/badgerbadgerbadger)
[![License](http://b.adge.me/:license-mit-blue.svg)](http://pikesley.mit-license.org)

#Badger

Because I grow weary of copy-n-pasting the badge URLs into the README of every project, and the [b.adge.me](http://b.adge.me) API now supports all of the services I use

##Usage

Add it to your Gemfile

    gem 'badgerbadgerbadger'
    bundle
    
Then
 
    badger badge
    [![Build Status](http://b.adge.me/travis/pikesley/badger.svg)](https://travis-ci.org/pikesley/badger)
    [![Coverage Status](http://b.adge.me/coveralls/pikesley/badger.svg)](https://coveralls.io/r/pikesley/badger)
    [![Dependency Status](http://b.adge.me/gemnasium/pikesley/badger.svg)](https://gemnasium.com/pikesley/badger)
    [![Code Climate](http://b.adge.me/codeclimate/github/pikesley/badger.svg)](https://codeclimate.com/pikesley/badger)
    
ready to paste into the top of your README (with the correct URLs for your repo (hopefully)).

Try

    badger help badge

For full usage. 

If you're on a Mac, pipe the output into `pbcopy` to add the stuff directly to your clipboard:

    badger badge | pbcopy

##Help me make it better

    git clone https://github.com/pikesley/badger
    cd badger
    bundle
    rake