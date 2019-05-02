Feature: Create a new recipe
  Background: The website already has the following recipes
    Given these Users:
      | username | password | email             |
      | Totes    | wowscool | totes@example.com |

    Given these Recipes:
      | name   | cuisine  | directions | calories | user_id |
      | Burger | American | Infected   |  300     | 1       |
      | Pizza  | Italian  | Infested   |  500     | 1       |


  Scenario: Create a new recipe with no image attached
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
    Then I should see "Totes"
    When I press "Create New Recipe"
    And I fill in the following:
      | Name            | Fried Burger Bacon        |
      | Cuisine         | Druggie Lunch             |
      | Directions      | Fry it up                 |
      | Calories        | 1000                      |

    When I press "Create Recipe"
    Then I should be on the recipes page
    And I should see that "Fried Burger Bacon" has a calorie count of "1000"

  Scenario: Create a new recipe with a specific image
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
    Then I should see "Totes"
    When I press "Create New Recipe"
    Given I am on the create new recipe page
    When I fill in the following:
    | Name            | Fried Burger Bacon        |
    | Cuisine         | Druggie Lunch             |
    | Directions      | Fry it up                 |
    | Calories        | 1000                      |

    When I attach the file "Burger.jpg" to "Image"
    When I press "Create New Recipe"
    Then I should be on the recipes page
    And I should see that "Fried Burger Bacon" has a calorie count of "1000"
    And I should see that "Fried Burger Bacon" has an image "Burger.jpg"
