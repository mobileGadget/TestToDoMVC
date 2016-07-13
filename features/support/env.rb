require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'

$target_loc = "http://gcloud-todos.appspot.com/examples/angularjs/#/"
$num_of_todo = 0
$content_text = ""
$todo_count = 0
$complete_count = 0
$at_the_time = ""

## See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
#RSpec.configure do |_config|

  Capybara.register_driver :selenium do |app|
    options = {
      browser: (ENV['BROWSER'] || 'firefox').to_sym
    }
    Capybara::Selenium::Driver.new(app, options)
  end

  # Increased the default max time to avoid the timing of the redirect from ThankYou page to My amaysim
  Capybara.default_max_wait_time = 15

  Capybara.default_driver = :selenium
  Capybara.save_path = "./results/"

  #$driver = Capybara

  # To run poltergeist
  #require 'capybara/poltergeist'
  #Capybara.javascript_driver = :poltergeist

#end

