Feature: Badge Robot

  Background:
    Given I double `hub remote -v` with stdout:
    """
origin https://github.com/doge/wow.git (fetch)
origin https://github.com/doge/wow.git (push)
    """

  Scenario: Generate default badges
    When I run `badger badge`
    Then the output should contain "Build Status"
    And the output should contain "doge/wow"