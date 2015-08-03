module SearchSteps
  require 'rspec'
  require 'gherkin'
  require './helpers/performance'
  require './page_classes/elements/primary_nav_menu'
  require './page_classes/elements/secondary_top_menu'
end

World(SearchSteps)

Given(/^the user enters text into the search field$/) do
  SecondaryTopMenu.open_search_menu
  SecondaryTopMenu.enter_search_text('Selenium')
end

Given(/^the user clicks the Search button$/) do
  search_button = SecondaryTopMenu.check_and_return_search_button
  Performance.click_and_measure_load_time(search_button, '/search')
end

Given(/^the browser has remained open for (\d+) seconds for the Red Hat team to look$/) do |duration|
  sleep duration.to_i
end

Then(/^close the browser after the test$/) do
  # browser is closed in env.rb by the @final hook
end