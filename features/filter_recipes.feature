Feature: Filter Recipes by attribute
  Background:
    Given these Users:
      | username | password | email             |
      | Totes    | wowscool | totes@example.com |

    Given these Recipes:
      | name   | cuisine  | directions     | calories | user_id |
      | Burger | American | Infected       |  300     | 1       |
      | Pizza  | Italian  | Infested       |  500     | 1       |
      | Cheese | American | Freshly Barfed |  200     | 1       |

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
      |Maximum Calories     | 700      |
      |Cuisine Type         | American |
    And I press "Filter"
    Then I should see "Burger"
    And I should see "Cheese"
    And I should not see "Pizza"

  Scenario: Filter then Unfilter:
    Given I am on the recipes page
    When I fill in the following:
      |Maximum Calories     | 700      |
      |Cuisine Type         | American |
    And I press "Filter"
    Then I should see "Burger"
    And I should see "Cheese"
    And I should not see "Pizza"
    And I follow "Clear Filters"
    And I should see "Cheese"
    And I should see "Pizza"
