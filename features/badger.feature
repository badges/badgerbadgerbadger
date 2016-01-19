Feature: Badge robot

  Background:
    Given git remote is "https://github.com/doge/wow"

  @travis @gemnasium @coveralls @gemspec @mit
  Scenario: One with everything
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Build Status](http://img.shields.io/travis/doge/wow.svg)](https://travis-ci.org/doge/wow)
[![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg)](https://gemnasium.com/doge/wow)
[![Coverage Status](http://img.shields.io/coveralls/doge/wow.svg)](https://coveralls.io/r/doge/wow)
[![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg)](https://codeclimate.com/github/doge/wow)
[![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
    """
    And the output should not contain:
    """
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
    """
    And the output should not contain:
    """
[![Badges](http://img.shields.io/:badges-7/7-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)
    """

   Scenario: Handle a non-git-repo gracefully
     When I run `badger badge /tmp`
     Then the output should contain:
     """
Run this from inside a git repo
     """
     And the exit status should be 1

   @no-remote
   Scenario: Handle a git repo without a github remote
     When I run `badger badge /tmp/not_wow`
     Then the output should contain:
     """
This repo does not appear to have a github remote
     """
     And the exit status should be 2

   Scenario:Get a sensible version string
     When I successfully run `badger -v`
     Then the output should contain:
     """
badger version
     """
