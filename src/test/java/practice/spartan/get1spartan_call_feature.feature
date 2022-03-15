Feature: Spartan Get 1 Data
  As a user ,
  I should be able to Get 1 Data using Spartan API
  The IP you can use is this http://54.236.150.168:8000/api

  Background:
    Given url spartan_url
    # create new data before each update scenario

    * def result = call read('generate_spartan.feature')
    * def newID = result.newID
    * print newID
    * print result.blabla


  Scenario: Should be able to Get 1 data GET /spartans/{id}

    Given path "/spartans/" + newID
    When method GET
    Then status 200



