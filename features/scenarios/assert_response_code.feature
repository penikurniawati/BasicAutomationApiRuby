Feature: Assert Response Code

    Scenario: Positive Test Case
        When I send and accept JSON
        And I send a GET request to "/api/users/2"
        Then the response status should be "200"

    Scenario: Negative Test Case    
        When I send and accept JSON
        And I send a POST request to "/api/register" with the following:
            """
                {
                    "email": "ragapinilih@gmail.com"
                }
            """
        Then the response status should be "400"
        And show me the response
