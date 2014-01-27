Feature: Badge Robot

  Scenario: Generate default badges
    Given git remote is "https://github.com/doge/wow.git"
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Build Status](http://b.adge.me/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Coverage Status](http://b.adge.me/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Dependency Status](http://b.adge.me/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Code Climate](http://b.adge.me/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
    """