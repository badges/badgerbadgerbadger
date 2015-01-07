Feature: Heroku remote

  Background:
    Given git remote "heroku" points to "git@heroku.com:doge.git"

    Scenario: Handle a git repo with only a Heroku remote
      When I run `badger badge /tmp/wow_repo`
      Then the output should contain:
      """
      This repo does not appear to have a github remote
      """
      And the exit status should be 2
