require 'pry'

# init variables
$num_of_todo = 0
$todo_count = 0
$complete_count = 0

When(/^I add a line of item at the top of the todo list with content "(.*?)"$/) do |content_text|
    $at_the_time = Time.now.strftime("%Y%m%d-%H%M%S")
    $content_text = content_text + '@' + $at_the_time
    within('#todo-list') {
      $num_of_todo = page.all('li').count
    }

    expect(page).to have_selector("#todo-list > li", count: $num_of_todo)
    #p "#{content_text}"
    fill_in("new-todo", with: "#{$content_text}\n")

    begin
        $complete_count = find(:id, 'clear-completed').text.gsub(/Clear completed \(|\)$/, '').to_i
    rescue
        $complete_count = 0
    end
    $todo_count = find('#todo-count strong').text.to_i


end

Given(/^I have an existing item on the todo list with content "(.*?)"$/) do |content_text|
    step 'I have an existing todo list'
    step 'I add a line of item at the top of the todo list with content "' + content_text + '"'
end

When(/^I check the box of the todo item to be complete$/) do
    expect(page).to have_current_path('/examples/angularjs/')
    li_list = page.all('#todo-list li')
    found = false
    i = 0
    while not found
        if i == li_list.count
            break
        end
        if li_list[i].text == $content_text
            li_list[i].find('div input').click
            found = true
        end
        i += 1
    end

end

Then(/^I expect the item to be marked complete$/) do
    click_link('Completed')
    expect(page).to have_current_path('/examples/angularjs/')
    li_list = page.all('#todo-list li')

    found = false
    i = 0
    while not found
        if i == li_list.count
            break
        end
        if li_list[i].text == $content_text
            found = true
        end
        i += 1
    end

    new_todo_count = page.all('#todo-count strong')[0].text.to_i
    expect(new_todo_count).to eq($todo_count - 1)
    new_complete_count = page.all(:id, 'clear-completed')[0].text.gsub(/Clear completed \(|\)$/, '').to_i        
    expect(new_complete_count).to eq(li_list.count)

    if not found
        expect('complete element not found').to eq(failed)
    end
end
