Feature: Badge Robot

  Scenario: Generate default badges
    Given the git remote is "
    When I run `badger badge`
    Then the output should contain "Build Status"