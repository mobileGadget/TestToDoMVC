
# init variable
$num_of_todo = 0

Given /^I have an existing todo list$/ do
    visit($target_loc)
    expect(page).to have_current_path('/examples/angularjs/')
end

When /^I add a line of item at the top of the todo list$/ do
    within('#todo-list') do
  	  $num_of_todo = page.all('li').count
    end

    expect(page).to have_selector("#todo-list > li", count: $num_of_todo)
    fill_in("new-todo", with: "Don't forget the milk!\n")

 
end

Then /^I expect the new item to appear at the bottom of the todo list$/ do
	expect(page).to have_selector("#todo-list > li", count: $num_of_todo + 1)
	selector = "#todo-list > li:nth-child(#{$num_of_todo}) > div > label"
    expect(page).to have_selector(selector)
    expect(find(selector)).to have_content("Don't forget the milk!")
end
