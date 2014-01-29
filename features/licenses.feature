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
    And the output should not contain:
    """
![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)
    """

  @license @apache
  Scenario: Generate Apache license
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
    """
    And the output should not contain:
    """
GPL
    """

  @license @gpl2
  Scenario: Generate GPL2 license
    When I successfully run `badger badge /tmp/wow_repo`
    Then the output should contain:
    """
![License](http://img.shields.io/:license-gpl2-blue.svg)](http://www.gnu.org/licenses/gpl-2.0.html)
    """
    And the output should not contain:
    """
MIT
    """