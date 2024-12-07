Feature: Home Page Functionality

  Background:
    Given the app is running

  Scenario: Displaying the Home Page with Search, Categories, and Products
    Then I should see a TextField for search
    And I should see a PageView widget
    And I should see a {BottomNav()} widget

  Scenario: Searching for a Product
    When I enter {"fg"} into {TextField()} input field
    Then I should see search results related to {'fg'}

  Scenario: Navigating to the Favorit Page
    When I tap{Icons.favorite} on the {BottomNav()} widget for the favorit tab
    Then the PageView should jump to the {1} Page and show the {"fav"} text
    
 Scenario: Navigating to the Cart Page
    When I tap{Icons.shopping_bag} on the {BottomNav()} widget for the cart tab
    Then the PageView should jump to the {2} Page and show the {"cart"} text
     
 Scenario: Navigating to the Profile Page
    When I tap{Icons.person} on the {BottomNav()} widget for the profile tab
    Then the PageView should jump to the {3} Page and show the {"profile"} text
     
  Scenario: Accessing the Settings Page
    When I tap {Icons.settings} icon
    Then I should be navigated to the {Setting} Page