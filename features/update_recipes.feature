Feature: Update an existing recipe
  As a user who has posted a recipe
  so that I can make later additions to my recipe
  I want to be able to edit my recipe's information

  Background: The following recipes already exists
    Given these Recipes:
      | name   | cuisine  | directions | calories |
      | Burger | American | Infected   |  300     |
      | Pizza  | Italian  | Infested   |  500     |
  Scenario: Update an existing recipe
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
