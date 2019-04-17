Feature: Login Button
  As a user of the site,
  So that I can associate my recipes with myself
  I want a unique username to call my own

  Scenario: Register an account and password, Log out, then log back in with it
    Given that I am on the recipes page
    When I press "login or create a new account"
    I should be on the login page
    When I press "create a new account" button
    When I fill in the following
    | Username | TotesGOAT |
    | Password | wowcool   |
    And I press "create account"
    Then I should be on the recipes page
    And I should see "TotesGOAT"
    And I press "logout"
    And I should see "login or create a new account"
    When I press "login or create a new account"
    And I should be on the login page
    When I fill in the following
    | Username | TotesGOAT |
    | Password | wowcool   |
    And I press "sign in"
    Then I should be on the recipes page
    And I should see "TotesGOAT"
  Scenario: Login from the index page
    Given that I am on the recipes page
    When I press "login or create a new account"
    I should be on the login page
    When I fill in the following
    | Username | TotesGOAT |
    | Password | wowcool   |
    And I press "login"
    Then I should be on the recipes page
    And I should see "TotesGOAT"

  Scenario: Login from the show page
    Given that I am on the show page
    When I press "login or create a new account"
    I should be on the login page
    When I fill in the following
    | Username | TotesGOAT |
    | Password | wowcool   |
    And I press "login"
    Then I should be on the recipes page
    And I should see "TotesGOAT"
