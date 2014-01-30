Feature: Get rubygems badge

  Background:
    Given git remote is "https://github.com/doge/wow.git"

  @gemspec
  Scenario: Get rubygems badge
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Gem Version](http://img.shields.io/gem/v/suchgem.svg)](https://rubygems.org/gems/suchgem)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
    """