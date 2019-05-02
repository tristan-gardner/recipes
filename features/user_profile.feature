Feature: Users have profiles with recipes and history shown
Background: The following already exist
Given these Users:
  | username | password | email             |
  | Totes    | wowscool | totes@example.com |
  | Gotes    | nopethat | nope@example.com  |

Given these Recipes:
  | name   | cuisine  | directions | calories | user_id|
  | Burger | American | Infected   |  300     | 1      |
  | Pizza  | Italian  | Infested   |  500     | 2      |
  Scenario: A user navigates to a profile that is not their own
    Given I am on the recipes page
    When I follow "Sign In"
    When I login with username "Totes" and password "wowscool"
    Then I should see "Pizza"
    When I follow "Pizza"
    Then I should see "Gotes"
    When I follow "Gotes"
    Then I should see "Pizza"
    And I should not see "Edit Recipe"
    And I should not see "Delete Recipe"
  Scenario: A user clicks on a recipe on a profile that is not their own
    Given I am on the recipes page
    When I follow "Sign In"
    When I login with username "Gotes" and password "nopethat"
    Then I should see "Burger"
    When I follow "Burger"
    Then I should see "Totes"
    When I follow "Gotes"
    Then I should see "Burger"
  Scenario: A user navigates to their own profile and sees options to delete recipes
    Given I am on the recipes page
    When I follow "Sign In"
    When I login with username "Totes" and password "wowscool"
    Then I should see "Totes"
    When I follow "Totes"
    Then I should see "Burger"
    And I should see "Edit Recipe"
    And I should see "Delete Recipe"
  Scenario: A user deletes a recipe from their profile
    Given I am on the recipes page
    When I follow "Sign In"
    When I login with username "Totes" and password "wowscool"
    Then I should see "Totes"
    When I follow "Totes"
    Then I should see "Burger"
    And I should see "Edit Recipe"
    And I should see "Delete Recipe"
    When I press "Delete Recipe"
    Then I should not see "Burger"
  Scenario: A User visits a recipe and then visits their profile
    Given I am on the recipes page
    When I follow "Sign In"
    When I login with username "Gotes" and password "nopethat"
    Then I should see "Pizza"
    When I follow "Pizza"
    Then I should see "Gotes"
    When I follow "Gotes"
    Then I should see "Your History:"
    And I should see "Pizza"
