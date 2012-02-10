Feature: generate subcommand

  In order to make blogs for hackers
  As a hacker using the octopress executable
  I want to generate static resources from my blog source

  Background:
    Given I have a blog

  Scenario: No flags, switches or arguments
    When I successfully run `octopress generate`
    Then a generated site should exist
