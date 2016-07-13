
# init variable
$num_of_todo = 0
$content_text = "NEW ITEM ADDED"

Given(/^I have an existing todo list$/) do
    visit($target_loc)
    expect(page).to have_current_path('/examples/angularjs/')
end

When(/^I add a line of item at the top of the todo list$/) do
    within('#todo-list') do
  	  $num_of_todo = page.all('li').count
    end

    expect(page).to have_selector("#todo-list > li", count: $num_of_todo)
    fill_in("new-todo", with: "#{$content_text}\n")

 
end

Then(/^I expect the new item to appear at the bottom of the todo list$/) do

    li_list = page.all('#todo-list li')
    found = false
    i = 0
    while not found
        if i == li_list.count
            break
        end
        if li_list[i].text == $content_text && i == $num_of_todo
            found = true
        end
        i += 1
    end

    if not found
        expect('added element not found').to eq(failed)
    end
end
