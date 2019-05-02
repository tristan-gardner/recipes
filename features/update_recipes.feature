Feature: Update an existing recipe
  Background: The following already exists
    Given these Users:
      | username | password | email             |
      | Totes    | wowscool | totes@example.com |

    Given these Recipes:
      | name   | cuisine  | directions | calories | user_id  |
      | Burger | American | Infected   |  300     | 1        |
      | Pizza  | Italian  | Infested   |  500     | 1        |
  Scenario: Update an existing recipe
    Given I am on the recipes page
    Then I should see "Sign In"
    When I follow "Sign In"
    And I fill in the following:
    |Login   |Totes   |
    |Password|wowscool|
    And I press "Log in"
    Then I should be on the recipes page
    And I should see "Totes"
    Given I am on the recipes page
    When I follow "Burger"
    Then I should see "Infected"
    And I should see "300"
    And I should not see "American"
    When I follow "Edit Recipe"
    And I fill in "Directions" with "Not infected"
    And I fill in "Cuisine" with "Albanian"
    And I attach the file "Burger.jpg" to "Image"
    And I press "Update Recipe"
    Then I should be on the recipes page
    And I should see "Not infected"
    And I should not see "Albanian"
    And I should see the image "Burger.jpg"
