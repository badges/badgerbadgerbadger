Feature: Badge Robot

  Background:
    Given git remote is "https://github.com/doge/wow.git"

  @license @mit
  Scenario: Generate MIT license
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
    """
    And the output should not contain:
    """
    Apache
    """
