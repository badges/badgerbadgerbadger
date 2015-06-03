Feature: Github issues and PRs

Background:
Given git remote is "https://github.com/doge/wow"

@travis @gemnasium @coveralls @gemspec @mit
Scenario: Include 'size' badge
  When I successfully run `badger badge --size /tmp/wow_repo`
  Then the output should contain:
  """
  [![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
  [![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
  [![Coverage Status](http://img.shields.io/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
  [![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
  [![Repo Size](http://reposs.herokuapp.com/?path=doge/wow.svg)](https://github.com/doge/wow)
  [![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)
  [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
  [![Badges](http://img.shields.io/:badges-8/8-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)
  """
