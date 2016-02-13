[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/badges/badgerbadgerbadger)
[![Dependency Status](http://img.shields.io/gemnasium/badges/badgerbadgerbadger.svg?style=flat-square)](https://gemnasium.com/badges/badgerbadgerbadger)
[![Coverage Status](http://img.shields.io/coveralls/badges/badgerbadgerbadger.svg?style=flat-square)](https://coveralls.io/r/badges/badgerbadgerbadger)
[![Code Climate](http://img.shields.io/codeclimate/github/badges/badgerbadgerbadger.svg?style=flat-square)](https://codeclimate.com/github/badges/badgerbadgerbadger)
[![Github Issues](http://githubbadges.herokuapp.com/badges/badgerbadgerbadger/issues.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger/issues)
[![Pending Pull-Requests](http://githubbadges.herokuapp.com/badges/badgerbadgerbadger/pulls.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger/pulls)
[![Gem Version](http://img.shields.io/gem/v/badgerbadgerbadger.svg?style=flat-square)](https://rubygems.org/gems/badgerbadgerbadger)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)
[![Badges](http://img.shields.io/:badges-9/9-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)
# Badger

Because I grow weary of copy-n-pasting the badge URLs into the README of every project, and the [img.shields.io](http://img.shields.io) API now supports all of the services I use

## Usage

Install it

    gem install badgerbadgerbadger

or add it to your Gemfile

    gem 'badgerbadgerbadger'
    bundle

Then

    badger badge
    [![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
    [![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
    [![Coverage Status](http://img.shields.io/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
    [![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
    [![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)
    [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
    [![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

ready to paste into the top of your README (with the correct URLs for your repo)

You can read about Badger's Opinions in the help text [here](https://github.com/pikesley/badger/blob/master/DESC.md)

If you're on a Mac, pipe the output into `pbcopy` to add the stuff directly to your clipboard:

    badger badge | pbcopy

## Help me make it better

    git clone https://github.com/pikesley/badger
    cd badger
    bundle
    rake

### Adding a new license

If you'd like badgerbadgerbadger to support a license we don't currently have, please see the note at the top of the [licenses config file](https://github.com/badges/badgerbadgerbadger/blob/master/config/licenses.yaml#L6-L7)
