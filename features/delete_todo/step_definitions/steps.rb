require 'pry'

# init variables
$num_of_todo = 0
$todo_count = 0
$complete_count = 0

When(/^I click the delete icon on the item to be deleted$/) do
    expect(page).to have_current_path('/examples/angularjs/')
    li_list = page.all('#todo-list li')
    found = false
    i = 0
    while not found
        if i == li_list.count
            break
        end
        if li_list[i].text == $content_text
            li_list[i].find('div').hover
            li_list[i].find(:xpath, '//div/button').hover           
            li_list[i].find(:xpath, '//div/button').click
            found = true
        else
            i += 1;
        end
    end

end

Then(/^I expect the item to be removed and the todo counter reduced by 1$/) do

    new_todo_count = page.all('#todo-count strong')[0].text.to_i
    expect(new_todo_count).to eq($todo_count - 1)

end


