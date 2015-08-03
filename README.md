Object-oriented Ruby Selenium automation demo for Red Hat
Kevin R. Emery, Jul 2015

Rake tasks are used to launch Cucumber, which is used as the test runner.
Cucumber allows Ruby step definitions within the .feature file(s) to be called from other features.
Step definitions call methods on a set of classes to traverse and test a website or web application.
Elements of pages which are common to multiple areas (such menu bars) are given their own class.
XPath element locators are coded in class methods, which interact with the website.

Prerequisites:
Bundler
Ruby, Rubygems (see Gemfile for other dependencies)
Selenium ChromeDriver: http://chromedriver.storage.googleapis.com/