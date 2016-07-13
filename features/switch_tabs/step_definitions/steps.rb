require 'pry'

# init variables
$num_of_todo = 0
$todo_count = 0
$complete_count = 0


When /^I click on the word Active$/ do
    $todo_count = find('#todo-count strong').text.to_i

    click_link('Active')
end

Then /^I expect to see the Active todo list tab$/ do

    expect(page).to have_current_path('/examples/angularjs/')
    li_list = page.all('#todo-list li')
    expect(li_list.count).to eq($todo_count)

end

When /^I click on the word Completed$/ do
    begin
        $complete_count = find(:id, 'clear-completed').text.gsub(/Clear completed \(|\)$/, '').to_i
    rescue
        $complete_count = 0
    end
    
    click_link('Completed')
end

Then /^I expect to see the Completed todo list tab$/ do

    expect(page).to have_current_path('/examples/angularjs/')
    li_list = page.all('#todo-list li')
    expect(li_list.count).to eq($complete_count)

end

