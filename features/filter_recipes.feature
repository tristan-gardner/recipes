Feature: Filter Recipes by attribute
  Background: The following are already created
    Given these recipes:
      | name   | cuisine  | directions     | calories |
      | Burger | American | Infected       |  300     |
      | Pizza  | Italian  | Infested       |  500     |
      | Cheese | American | Freshly Barfed |  200     |

  Scenario: Filter on one Calories
    Given that I am on the recipes page
    When I fill in the following:
      | Maximum calories  | 201 |
    And I press "Filter"
    Then I should see "Cheese"
    And I should not see "Pizza"
    And I should not see "Burger"

  Scenario: Filter on Cuisine
    Given that I am on the recipes page
    When I fill in the following:
      | Cuisine | Italian |
    And I press "Filter"
    Then I should see "Pizza"
    And I should not see "Burger"
  Scenario: Filter on Multiple Categories
    Given that I am on the recipes page
    When I fill in the following:
      |Cuisine         | American |
      |Maximum calories| 700      |
    And I press "Filter"
    Then I should see "Burger"
    And I should see "Cheese"
    And I should not see "Pizza"
