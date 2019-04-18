Feature: Filter Recipes by attribute
  Background: The following are already created
    Given these Recipes:
      | name   | cuisine  | directions     | calories |
      | Burger | American | Infected       |  300     |
      | Pizza  | Italian  | Infested       |  500     |
      | Cheese | American | Freshly Barfed |  200     |

  Scenario: Filter on one Calories
    Given I am on the recipes page
    Then I should see "Burger"
    And I should see "Pizza"
    And I should see "Cheese"
    When I fill in the following:
      | Maximum Calories  | 201 |
    And I press "Filter"
    Then I should see "Cheese"
    And I should not see "Pizza"
    And I should not see "Burger"

  Scenario: Filter on Cuisine
    Given I am on the recipes page
    When I fill in the following:
      | Cuisine Type | Italian |
    And I press "Filter"
    Then I should see "Pizza"
    And I should not see "Burger"

  Scenario: Filter on Multiple Categories
    Given I am on the recipes page
    When I fill in the following:
      |Cuisine Type         | American |
      |Maximum Calories| 700      |
    And I press "Filter"
    Then I should see "Burger"
    And I should see "Cheese"
    And I should not see "Pizza"

  Scenario: Filter then Unfilter:
    Given I am on the recipes page
    When I fill in the following:
      |Cuisine Type         | American |
      |Maximum Calories| 700      |
    And I press "Filter"
    Then I should see "Burger"
    And I should see "Cheese"
    And I should not see "Pizza"
    And then I press "Clear Filters"
    And I should see "Cheese"
    And I should see "Pizza"
