Feature: This will be a reusable feature file to generate new Spartan

  This will be called from outside and return spartan id

  Background:
    Given url spartan_url
  Scenario: Should be able to add data using POST /spartans with Random Body

    ## Bring the type called SpartanUtility and use it's static method
    * def SpartanUtility = Java.type("practice.utility.SpartanUtility")
      ## Call the method and store the result into variable
    * def randomMapBody = SpartanUtility.getRandomSpartanMapBody()
    * print randomMapBody

    Given path "/spartans"
    And header Content-Type = "application/json"
    And request randomMapBody
    When method POST
    * print "Newly generated Spartan ID", response.data.id
    * def newID = response.data.id
    * def blabla = "bla bla bla thanks for attending"
