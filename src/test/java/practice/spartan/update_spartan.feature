Feature: Spartan Update Data
  As a user ,
  I should be able to Update Data using Spartan API
  The IP you can use is this http://54.236.150.168:8000/api

  Background:
    Given url spartan_url
    # create new data before each update scenario
    # so we can use newly generated data for updating
    ## Bring the type called SpartanUtility and use it's static method
    * def SpartanUtility = Java.type("practice.utility.SpartanUtility")
      ## Call the method and store the result into variable
    * def randomMapBody = SpartanUtility.getRandomSpartanMapBody()
    Given path "/spartans"
    And header Content-Type = "application/json"
    And request randomMapBody
    When method POST
    * def newId = response.data.id
    ## Generate randomUpdatedBody
    * def randomUpdatedBody = SpartanUtility.getRandomSpartanMapBody()
    * print "randomUpdatedBody", randomUpdatedBody

  Scenario: Should be able to update data PUT /spartans/{id}
#      Given path "spartans", newId
    Given path "/spartans/" + newId
    And header Content-Type = "application/json"
    And request randomUpdatedBody
    When method PUT
    Then status 204
  # In order to check if it is actually updated send another Get request
    Given path "/spartans/" + newId
    When method GET
    Then status 200
    # optionally check each and every field value matches

  ## Optionally Clean up this Data by Sending DELETE /spartans/{id} request
    Given path "/spartans/" + newId
    When method DELETE
    Then status 204
    ## How do you know it is actually deleted
    Given path "/spartans/" + newId
    When method GET
    Then status 404



