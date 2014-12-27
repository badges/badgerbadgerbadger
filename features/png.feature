Feature: Badge robot

  Background:
    Given git remote is "https://github.com/doge/wow"

  @travis @gemnasium @coveralls @gemspec @mit
  Scenario: One with everything
    When I successfully run `badger badge /tmp/wow_repo --png `
    Then the output should contain:
    """
[![Build Status](http://img.shields.io/travis/doge/wow.png)](https://travis-ci.org/doge/wow)
[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.png)](https://gemnasium.com/doge/wow)
[![Coverage Status](http://img.shields.io/coveralls/doge/wow.png)](https://coveralls.io/r/doge/wow)
[![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.png)](https://codeclimate.com/github/doge/wow)
[![Gem Version](http://img.shields.io/gem/v/suchgem.png)](https://rubygems.org/gems/suchgem)
[![License](http://img.shields.io/:license-mit-blue.png)](http://doge.mit-license.org)
[![Badges](http://img.shields.io/:badges-7/7-ff6799.png)](https://github.com/badges/badgerbadgerbadger)
    """
