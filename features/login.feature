Feature: Login Button
  Scenario: Register an account and password, Log out, then log back in with it
    Given I am on the recipes page
    Then I should see "Sign In"
    And I should see "Sign Up"
    When I follow "Sign Up"
    When I fill in the following:
    | Username | TotesGOAT |
    | Email    | GOATsim@example.com |
    | Password | wowscool   |
    And I follow the "second" "Sign Up"
    And I should see "TotesGOAT"
    And I should see "Sign Out"
    And I follow "Sign Out"
    And I should see "Sign In"
    When I follow "Sign In"
    And I should be on the login page
    When I fill in the following:
    | Username | TotesGOAT |
    | Email    | GOATsim@example.com |
    | Password | wowscool   |
    And I press "Sign In"
    Then I should be on the recipes page
    And I should see "TotesGOAT"

  Scenario: Login from the index page
    Given I am on the recipes page
    Then I should see "Sign In"
