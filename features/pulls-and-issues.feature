Feature: Github issues and PRs

Background:
Given git remote is "https://github.com/doge/wow"

@travis @gemnasium @coveralls @gemspec @mit
Scenario: One with everything
  When I successfully run `badger badge --pulls /tmp/wow_repo`
  Then the output should contain:
  """
  [![Build Status](http://img.shields.io/travis/doge/wow.svg?style=flat-square)](https://travis-ci.org/doge/wow)
  [![Dependency Status](http://img.shields.io/gemnasium/doge/wow.svg?style=flat-square)](https://gemnasium.com/doge/wow)
  [![Coverage Status](http://img.shields.io/coveralls/doge/wow.svg?style=flat-square)](https://coveralls.io/r/doge/wow)
  [![Code Climate](http://img.shields.io/codeclimate/github/doge/wow.svg?style=flat-square)](https://codeclimate.com/github/doge/wow)
  [![Github Issues](http://githubbadges.herokuapp.com/doge/wow/issues.svg?style=flat-square)](https://github.com/doge/wow/issues)
  [![Pending Pull-Requests](http://githubbadges.herokuapp.com/doge/wow/pulls.svg?style=flat-square)](https://github.com/doge/wow/pulls)
  [![Gem Version](http://img.shields.io/gem/v/suchgem.svg?style=flat-square)](https://rubygems.org/gems/suchgem)
  [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://doge.mit-license.org)
  """
