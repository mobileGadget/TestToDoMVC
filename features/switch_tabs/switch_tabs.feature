@switch_lists
Feature: Switch todo list tabs

  @switch_to_active_list
  Scenario: User can choose to see active todo list only
    Given I have an existing todo list
    When I click on the word Active
    Then I expect to see the Active todo list tab
    
  @switch_to_completed_list
  Scenario: User can choose to see completed todo list only
    Given I have an existing todo list
    When I click on the word Completed
    Then I expect to see the Completed todo list tab