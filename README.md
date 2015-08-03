Object-oriented Ruby Selenium automation demo for Red Hat

Kevin Emery, Jul 2015

Rake tasks are used to launch Cucumber, which in turn allows Ruby step definitions within .feature (Gherkin) files to be called from other features.  Step definitions call methods on a set of classes to traverse and test a website or web application.

Elements of pages which are common to multiple areas (such menu bars) are given their own class.<br />
XPath element locators are coded in class methods, which interact with the website.<br />

<ul><b>Prerequisites:</b>
<li>Ruby 2.2.1 or newer with Rubygems</li>
<li>Bundler (gem install bundler)</li>
<li>Selenium ChromeDriver<ul>
  <li>downloaded from https://chromedriver.storage.googleapis.com/index.html</li>
  <li>path to file system location is set in /features/support/env.rb:7</li></ul>
</ul>
