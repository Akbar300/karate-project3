Feature: Spartan Get Data using get requests
  As a user ,
  I should be able to ping Spartan API
  The IP you can use is this http://54.236.150.168:8000/api

  Background:
    Given url spartan_url

  Scenario: Should be able to get all Spartans using /spartans endpoint
    And path "spartans"
    When method GET
    Then status 200
    Then match header Content-Type == "application/json"



  Scenario: Should be able to get all Spartans xml using /spartans endpoint
    And path "spartans"
   ## This is how you can specify header
    And header Accept = "application/xml"
    When method GET
    Then status 200
    Then match header Content-Type == "application/xml"

    # http://54.236.150.168:8000/api/spartans/search?gender=Male&nameContains=A
  Scenario: Should be able to search using /spartans/search
#    And path "/spartans/search"
    And path "spartans" ,"search"
    And param gender = "Male"
    And param nameContains = "A"
    When method GET
    Then status 200




