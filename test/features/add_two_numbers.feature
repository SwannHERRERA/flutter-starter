Feature: Calculator
  Tests the addition feature of the calculator;

  Scenario: Add two numbers
    Given the numbers 1.5 and 2.1
    When they are added
    Then the expected result should be 3.6
