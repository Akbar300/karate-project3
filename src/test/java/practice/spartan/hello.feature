Feature: Spartan API try out
  As a user ,
  I should be able to ping Spartan API
  The IP you can use is this http://54.236.150.168:8000/api

  Scenario: Should be able to Get response for /hello endpoint
    
    # set up the base url 
    Given url "http://54.236.150.168:8000/api/hello"
    When method GET
    Then status 200

