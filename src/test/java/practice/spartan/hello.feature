Feature: Spartan API try out
  As a user ,
  I should be able to ping Spartan API
  The IP you can use is this http://54.236.150.168:8000/api

  # You can reuse first step or first few steps of scenarios if it repeat
  # using Background: section
  Background:
     Given url spartan_url

  Scenario: Should be able to Get response for /hello endpoint
    
    # set up the base url 
    # Given url "http://54.236.150.168:8000/api/hello"
    # path can be used to add more path to the base url defined above
    Given path "hello"
    When method GET
    Then status 200
    Then match header Content-Type == "text/plain;charset=UTF-8"
    Then match header Content-Length == "17"
    # This is how we can assert entire body using response and match keyword
    Then match response == "Hello from Sparta"
