Feature: Spartan Get Data using get requests
  As a user ,
  I should be able to Add Data using Spartan API
  The IP you can use is this http://54.236.150.168:8000/api

  Background:
    Given url spartan_url

  Scenario: Variable Practice
    Given def bootcamp = "Karate BDD"
    Then print bootcamp
    * def payload =
      """
        {
            "name" : "Bootcamp User",
            "gender" : "Male",
            "phone" : 1231231231
        }
      """
    * print payload


    Scenario: Should be able to use Java classes directly in Karate
      # this is how we can bring java type into karate feature file
      # by providing fully qualified name into  Java.Type( here )
      * def strClassFromJava = Java.type("java.lang.String")
      * def newStringObj = new strClassFromJava("Hello There")
      * print newStringObj.toLowerCase()

      ## Bring the type called SpartanUtility and use it's static method
      * def SpartanUtility = Java.type("practice.utility.SpartanUtility")
      ## Call the method and store the result into variable
      * def randomMapBody = SpartanUtility.getRandomSpartanMapBody()
      * print randomMapBody




  Scenario: Should be able to add data using POST /spartans
    ## This is how you can store multi line string
    * def payload =
      """
        {
            "name" : "Bootcamp User",
            "gender" : "Male",
            "phone" : 1231231231
        }
      """
    Given path "/spartans"
    And header Content-Type = "application/json"
    And request payload
    When method POST
    Then status 201
    * print "Newly generated Spartan ID", response.data.id