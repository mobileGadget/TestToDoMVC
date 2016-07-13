Feature: Remove an item on the todo list

  @delete_a_todo_item
  Scenario: User can delete a todo item
    Given I have an existing item on the todo list with content "TO BE DELETED"
    When I click the delete icon on the item to be deleted
    Then I expect the item to be removed and the todo counter reduced by 1
    
