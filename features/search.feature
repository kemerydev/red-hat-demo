Feature: Text search

  Scenario: Perform a text search from the secondary navigation menu
    Given a public user navigates to the Red Hat homepage at http://www.redhat.com/en
    Then the secondary top nav menu should be visible
    Given the user enters text into the search field
    And the user clicks the Search button

  @final
  Scenario: close the browser
    Given the browser has remained open for 8 seconds for the Red Hat team to look
    Then close the browser after the test