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

  Scenario: Should be able to get One Spartan
    
    And path "/spartans/1"
    When method GET
    Then status 200
    ## Karate does not require the Given When Then keyword
    ## It's just for readability you can replace them with * when needed
    ## Here is how we can print anything
    * print "Hello World"
    ## {"id":1,"name":"Toronto","gender":"Male","phone":98765432112}
    * print "ID of this user is " , response.id
    * print "Name of this user is " , response.name
    * print "Phone of this user is " , response.phone
    * print "Gender of this user is " , response.gender
    And match response.id == 1
    And match response.name == "Toronto"
    And match response.phone == 98765432112
    And match response.gender == "Male"
    And match response == {id:1, name:"Toronto", gender: "Male", phone :98765432112}



    # http://54.236.150.168:8000/api/spartans/search?gender=Male&nameContains=A
  Scenario: Should be able to search using /spartans/search and jsonpath practice
#    And path "/spartans/search"
    And path "spartans" ,"search"
    And param gender = "Male"
    And param nameContains = "A"
    When method GET
    Then status 200
    * print "Total Element in this result is" , response.totalElement
    And match response.totalElement == 34
    * print "First Guy name value", response.content[0].name
    * print "Second guy phone number", response.content[1].phone
    # Using * in index of json array to get all the items instead of one
    # And you can use match someJsonArray conatain someItem to partial search
    * match response.content[*].name contains "Sinclair"
    # checking more than one items
    * match response.content[*].name contains ["Sinclair","Wash"]
    # You can do relative path using double dot .. to shortern your jsonpath if it's deeply nested
    * match response..name contains ["Sinclair","Wash"]




