Feature: To test adding new todo items

  @add_a_new_todo_item
  Scenario: User can add a new todo item
    Given I have an existing todo list
    When I add a line of item at the top of the todo list
    Then I expect the new item to appear at the bottom of the todo list
    
