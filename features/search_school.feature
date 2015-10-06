Feature: As an API client, I should be able to search school by school name and CDSCode

Scenario: Search by name
  Given I send a request to CHS API with school name
   Then I should receive schools that match the name

  Scenario: Search by CDSCode
  Given I send a request to CHS API with CDSCode
   Then I should receive a school that match the code

