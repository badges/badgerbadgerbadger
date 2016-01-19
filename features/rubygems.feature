Feature: Get rubygems badge

  Background:
    Given git remote is "https://github.com/doge/wow.git"

  @gemspec
  Scenario: Get rubygems badge
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Gem Version](http://img.shields.io/gem/v/suchgem.svg?style=flat-square)](https://rubygems.org/gems/suchgem)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://doge.mit-license.org)
    """

  @gemspecmultilicense @gpl3
  Scenario: Get multiple licenses
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Gem Version](http://img.shields.io/gem/v/suchgem.svg?style=flat-square)](https://rubygems.org/gems/suchgem)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://doge.mit-license.org)
[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![License](http://img.shields.io/:license-gpl3-blue.svg?style=flat-square)](http://www.gnu.org/licenses/gpl-3.0.html)
    """

  @gemspecnolicense
  Scenario: Handle a gemspec *without* a license
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Gem Version](http://img.shields.io/gem/v/suchgem.svg?style=flat-square)](https://rubygems.org/gems/suchgem)
    """

    And the output should not contain:
    """
License
    """

  @gemspecwiths
  Scenario: Handle a gemspec with 's' not 'spec'
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
[![Gem Version](http://img.shields.io/gem/v/suchgem.svg?style=flat-square)](https://rubygems.org/gems/suchgem)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://doge.mit-license.org)
    """
