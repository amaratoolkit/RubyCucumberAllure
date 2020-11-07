
Feature: As an user I want to see Welcome message

@TC-01 @docker @web
Scenario: Verify error messages of username input and password input
Given Enter given url and click on signin link
When Enter incorrect username and incorrect password
#Then Verify error messages

@TC-02 @docker @web
Scenario: Verify successfull login as admin user
Given Enter given url and click on signin link
When Enter correct username and correct password
