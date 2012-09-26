Feature: Signing in

Scenario: Unsuccessful signin
	Given a user visits signin page
	When he submit invalid signin information
	Then he should see an error message

Scenario:	Successfully signin
	Given a user visits signin page
	And the user has an account
	And the user submits valid signin information
	Then he should see his profile page
	And he signout link	
