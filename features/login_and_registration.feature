@login @registration
Feature: Login and registration
  As a volunteer
  I want to be able to sign in
  So that I can volunteer for projects

  Scenario: User creates an account
    Given I am an unauthenticated user
    And I am on the new user registration page
    When I fill in "Email" with "my_email@email.com"
    And I fill in "Password" with "mypassword"
    And I fill in "Password confirmation" with "mypassword"
    And I press "Sign up"
    Then I should be on the home page
    And I should see "Welcome! You have signed up successfully."

  @email
  Scenario: User creates an account, should receive email
    Given I am an unauthenticated user
    And I am on the new user registration page
    When I fill in "Email" with "test@crigor.com"
    And I fill in "Password" with "mypassword"
    And I fill in "Password confirmation" with "mypassword"
    And I press "Sign up"
    Then "test@crigor.com" should receive an email
    When I open the email
    Then I should see "confirm" in the email body
    When I follow "Confirm my account" in the email
    Then I should see "successfully confirmed"
