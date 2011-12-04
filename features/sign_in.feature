Feature: sign in to application 
  In order to use the application
  As a user 
  I need to be able to sign in 


@wip 
Scenario: create an admin account
  Given there are 0 users 
  When I visit the sign in page 
  And I sign in through github 
  Then I am redirected to the home page 
  And I my github user name is shown 

Scenario: create an regular account
  Given there are 1 users 
  When I visit the sign in page 
  And I sign in through github 
  Then I am redirected to the awaiting authorization page 

Scenario: sign in with a regular account 
  Given I have a regular authorized account 
  When I visit the sign in page 
  And I sign in through github 
  Then I am redirected to the home page 
