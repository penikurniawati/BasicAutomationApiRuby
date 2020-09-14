Feature: Request With Parameter

Scenario: Request With Parameter
 When I send and accept JSON
 And I send a GET request to "/api/users" with the following:
    | page      | 2 |
    | per_page  | 6 |
 Then the response status should be "200"
 And show me the response