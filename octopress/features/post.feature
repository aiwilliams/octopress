Feature: post subcommand

  In order to make a new blog post
  As a hacker using the octopress executable
  I want to create a post having a name

  Background:
    Given I have a blog

  Scenario: No flags, switches or arguments
    When I successfully run `octopress post`
    Then a post with filename "YYYY-MM-DD-new-post.markdown" should exist
    And the post "new-post.markdown" should contain front matter:
      | title | "new-post" |

  Scenario: Specify postname with no spaces or quoting
    When I successfully run `octopress post named`
    Then a post with filename "YYYY-MM-DD-named.markdown" should exist

