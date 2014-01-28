Feature: Badge Robot

  Background:
    Given git remote is "https://github.com/doge/wow.git"

  Scenario: Generate default badges
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Build Status](http://b.adge.me/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Dependency Status](http://b.adge.me/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
    """
    And the output should not contain:
    """
![License](http://b.adge.me/:license-mit-blue.svg)](http://doge.mit-license.org)
    """
    And the output should not contain:
    """
[![Gem Version](http://b.adge.me/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)
    """

  Scenario: Generate only a subset of badges
    When I successfully run `badger badge --not travis /tmp/wow_repo`
    Then the output should contain:
    """
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Dependency Status](http://b.adge.me/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
    """
    And the output should not contain:
    """
[![Build Status](http://b.adge.me/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
    """

  Scenario: Generate a small subset of badges
     When I successfully run `badger badge --not coveralls,codeclimate /tmp/wow_repo`
     Then the output should contain:
     """
[![Build Status](http://b.adge.me/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Dependency Status](http://b.adge.me/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
     """
     And the output should not contain:
     """
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
     """
     And the output should not contain:
     """
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
     """

   Scenario: Generate only certain badges
     When I successfully run `badger badge --only coveralls,codeclimate /tmp/wow_repo`
     Then the output should contain:
     """
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
     """

   Scenario: Generate additional badges
     When I successfully run `badger badge --also mit /tmp/wow_repo`
     Then the output should contain:
     """
[![Build Status](http://b.adge.me/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Dependency Status](http://b.adge.me/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
[![License](http://b.adge.me/:license-mit-blue.svg)](http://doge.mit-license.org)
     """

   @gemspec
   Scenario: Generate badges based on gemspec
     When I successfully run `badger badge /tmp/wow_repo`
     Then the output should contain:
     """
[![Build Status](http://b.adge.me/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Dependency Status](http://b.adge.me/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
[![Gem Version](http://b.adge.me/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)
[![License](http://b.adge.me/:license-mit-blue.svg)](http://doge.mit-license.org)
     """

   @gemspec
   Scenario: gemspec and --also mit
     Given I successfully run `badger badge --also mit /tmp/wow_repo`
     Then the output should not contain:
     """
[![License](http://b.adge.me/:license-mit-blue.svg)](http://doge.mit-license.org)
[![License](http://b.adge.me/:license-mit-blue.svg)](http://doge.mit-license.org)
     """