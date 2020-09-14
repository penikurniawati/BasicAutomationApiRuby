Feature: Assert Response Body

  Scenario: Assert Response Body
    When I send and accept JSON
    And I send a GET request to "/api/users/2"
    Then the response status should be "200"
    And the JSON response should be:
        """
            {
                "data": {
                    "id": 2,
                    "email": "janet.weaver@reqres.in",
                    "first_name": "Janet",
                    "last_name": "Weaver",
                    "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
                },
                "ad": {
                    "company": "StatusCode Weekly",
                    "url": "http://statuscode.org/",
                    "text": "A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."
                }
            }
        """
    Scenario: Assert Response Body Specific Key
        When I send and accept JSON
        When I send a POST request to "/api/users" with the following:
        """
            {
                "name": "morpheus",
                "job": "bawahan",
                "pocket": [
                    {
                        "wallet": 10000
                    },
                    {
                        "wallet": 15000
                    },
                    {
                        "wallet": 50000
                    }
                ]
            }
        """
        Then the response status should be "201"
        And show me the response
        And the JSON response should have "$.name" with the text "morpheus"
        And the JSON response should have "$.job" with the text "bawahan"
        And the JSON response should have "$.pocket[1].wallet" with the text "15000"

    Scenario: Assert Response Body Length
    When I send and accept JSON
    And I send a GET request to "/api/users" with the following:
        | page      | 1|
        | per_page  | 9|
    Then the response status should be "200"
    And show me the response
    And the JSON response should have "$.data..id" with a length of 9