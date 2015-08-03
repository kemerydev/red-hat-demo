module MenuLinksSteps
  require 'rspec'
  require 'gherkin'
  require './helpers/performance'
  require './page_classes/pages/landing_page'
  require './page_classes/elements/primary_nav_menu'
  require './page_classes/elements/secondary_top_menu'
end

World(MenuLinksSteps)

Given(/^a public user navigates to the Red Hat homepage at (.+)$/) do |red_hat_spec_url|
  red_hat_spec_url.eql?($red_hat_url).should == true
  $driver.get $red_hat_url
end

Then(/^at least (\d+) (.+) button should be visible$/) do |num_buttons, button_text|
  LandingPage.check_buttons(num_buttons, button_text)
end

Then(/^the primary menu links should be visible$/) do
  PrimaryNavMenu.check_content
end

Then(/^the secondary top nav menu should be visible$/) do
  SecondaryTopMenu.check_content
end

# strings or numbers can be pulled from business-readable step definitions in Gherkin
Given(/^a user clicks (.+) in the secondary menu the page should redirect to (.+)$/) do |link_text, link_path|
  link = SecondaryTopMenu.check_and_return_link(link_text, link_path)
  Performance.click_and_measure_load_time(link, link_path)
end

Given(/^a user clicks (.+) then the primary nav menu should slide down with an explore button$/) do |link_text|
  PrimaryNavMenu.open_top_menu(link_text)
  PrimaryNavMenu.check_explore_button
end

Given(/^the user clicks to open the (.+) option from the primary nav menu/) do |menu_name|
  PrimaryNavMenu.open_top_menu(menu_name)
end

Then(/^the (.+) column header should be displayed in the primary nav menu$/) do |column_name|
  PrimaryNavMenu.check_column_header(column_name)
end

Given(/^a user clicks (.+) in the primary nav menu then the browser should redirect to (.+)$/) do |link_text, link_path|
  link = PrimaryNavMenu.check_and_return_menu_link(link_text, link_path)
  Performance.click_and_measure_load_time(link, link_path)

  if $driver.current_url.include?('access.redhat.com')
    $driver.get($red_hat_url)
    $wait.until { $driver.execute_script('return document.readyState').eql?('complete') }
  end
end