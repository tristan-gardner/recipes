Feature: Create a new recipe
  Background: The website already has the following recipes
    Given these Recipes:
      | name   | cuisine  | directions | calories |
      | Burger | American | Infected   |  300     |
      | Pizza  | Italian  | Infested   |  500     |

  Scenario: Create a new recipe with no image attached
    Given I am on create recipe page
    When I fill in the following:
      | Name            | Fried Burger Bacon        |
      | Cuisine         | Druggie Lunch             |
      | Directions      | Fry it up                 |
      | Calories        | 1000                      |

    When I press "Create Recipe"
    Then I should be on the recipes page
    And I should see that "Fried Burger Bacon" has a calorie count of "1000"

  Scenario: Create a new recipe with a specific image
    Given I am on the create new recipe page
    When I fill in the following:
    | Name            | Fried Burger Bacon        |
    | Cuisine         | Druggie Lunch             |
    | Directions      | Fry it up                 |
    | Calories        | 1000                      |

    When I attach the file "Burger.jpg" to "Image"
    When I press "Create Recipe"
    Then I should be on the recipes page
    And I should see that "Fried Burger Bacon" has a calorie count of "1000"
    And I should see that "Fried Burger Bacon" has an image "Burger.jpg"
