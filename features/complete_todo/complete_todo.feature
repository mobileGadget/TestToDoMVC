Feature: Complete an item on the todo list

  @complete_a_todo_item
  Scenario: User can mark a todo item as complete
    Given I have an existing item on the todo list with content "ITEM TO BE COMPLETE"
    When I check the box of the todo item to be complete
    Then I expect the item to be marked complete
    
