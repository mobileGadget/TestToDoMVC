# TestToDoMVC
An automated test suite written in Ruby and Cucumber to test ToDoMVC

The purpose of this test suite is to exercise a web automation with Cucumber and Capybarausing Ruby.  The target page is http://gcloud-todos.appspot.com/examples/angularjs/#/ which is a simple todo list written in angularJS.

To run the automate test suite:

1. Download or clone the repository
2. Check that the latest is in master (or experiment with the latest branch)
3. Type 'bundle install' without quotes
4. Type 'BROWSER=chrome cucumber' or optional for the BROWSER flag if running the test using firefox, just type 'cucumber'.  BROWSER=safari or ie is also possible providing the correct drivers have been installed.  You can find more info here: https://github.com/SeleniumHQ/selenium/wiki/SafariDriver and here: http://selenium-release.storage.googleapis.com/index.html
5. If any test fails, a report will be under results/ folder

