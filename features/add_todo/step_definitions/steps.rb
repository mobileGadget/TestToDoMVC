
# variable declaration
numberOfTodo = 0

Given /^I have an existing todo list$/ do
    visit($target_loc)
end

When /^I add a line of item at the top of the todo list$/ do
    expect(page).to have_current_path('/examples/angularjs/')
    within('#todo-list') do
  	  numberOfTodo = page.all('li').count
    end

    expect(page).to have_selector("#todo-list > li", count: numberOfTodo)
    fill_in("new-todo", with: "Don't forget the milk!\n")

 
end

Then /^I expect the new item to appear at the bottom of the todo list$/ do
	expect(page).to have_selector("#todo-list > li", count: numberOfTodo + 1)
	selector = "#todo-list > li:nth-child(#{numberOfTodo}) > div > label"
    expect(page).to have_selector(selector)
    expect(find(selector)).to have_content("Don't forget the milk!")
end
