Feature: Get service badges

  Background:
    Given git remote is "https://github.com/doge/wow.git"

  @travis
  Scenario: Generate travis badge
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
    """
    And the output should not contain:
    """
[![Coverage Status](http://img.shields.io/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
    """
    And the output should not contain:
    """
[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
    """

  @gemnasium
  Scenario: Generate gemnasium badge
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
   """

  @coveralls
  Scenario: Generate coveralls badge
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Coverage Status](http://img.shields.io/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
    """
    And the output should not contain:
    """
[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
    """

  @codeclimate
  Scenario: Generate codeclimate badge
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
    """