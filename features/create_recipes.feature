Feature: Create a new recipe
  As cook
  so that I can share my recipes with other people
  I want to be able to create a new recipe.

  Background: The website already has the following recipes
    Given these Recipes:
      | name   | cuisine  | directions | calories |
      | Burger | American | Infected   |  300     |
      | Pizza  | Italian  | Infested   |  500     |

  Scenario: Create a new recipe with no image attached
    Given I am on the create new recipe page
    When I fill in the following:
      | name            | Fried Burger Bacon        |
      | cuisine         | Druggie Lunch             |
      | directions      | Fry it up                 |
      | calories        | 1000                      |

    When I press "Create Recipe"
    Then I should be on the recipes page
    And I should see "New recipe 'Fried Burger Bacon' created"
    And I should see that "Fried Burger Bacon" has a calories of "1000"

  Scenario: Create a new recipe with a specific image
    Given I am on the create new recipe page
    When I fill in the following:
    | name            | Fried Burger Bacon        |
    | cuisine         | Druggie Lunch             |
    | directions      | Fry it up                 |
    | calories        | 1000                      |

    When I attach the file "Burger.jpg" to "Image"
    When I press "Create Recipe"
    Then I should be on the recipes page
    And I should see "New recipe 'Fried Burger Bacon' created"
    And I should see that "Fried Burger Bacon" has a calories of "1000"
    And I should see that "Fried Burger Bacon" has an image "Burger.jpg"
