Feature: User Profile
  Scenario:Created recipes show on the page
  Given these Users:
    | username | password | email             |
    | Totes    | wowscool | totes@example.com |

  Given these Recipes:
    | name   | cuisine  | directions | calories | user_id|
    | Burger | American | Infected   |  300     | 1      |
    | Pizza  | Italian  | Infested   |  500     | 1      |
