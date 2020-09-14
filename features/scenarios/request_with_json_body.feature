Feature: Request with JSON Body

Scenario: Request with JSON Body 
    When I send and accept JSON
    When I send a POST request to "/api/users" with the following:
    """
        {
            "name": "morpheus",
            "job": "leader",
            "relationship": "married",
            "kids": " 5",
            "children":[{
                "name":"neo"
            }]

        }
    """

    Then the response status should be "201"
    And show me the response