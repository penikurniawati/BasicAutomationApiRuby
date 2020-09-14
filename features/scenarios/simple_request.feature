Feature: Simple Request

  Scenario: Simple Request
    When I send and accept JSON
    And I send a GET request to "/api/users/2"
    Then the response status should be "200"
    And show me the response