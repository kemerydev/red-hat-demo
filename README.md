Object-oriented Ruby Selenium automation demo for Red Hat

Kevin Emery, Jul 2015

Rake tasks are used to launch Cucumber, which in turn allows Ruby step definitions within .feature (Gherkin) files to be called from other features.  Step definitions call methods on a set of classes to traverse and test a website or web application.

Elements of pages which are common to multiple areas (such menu bars) are given their own class.<br />
XPath element locators are coded in class methods, which interact with the website.<br />

<ol>Prerequisites:
<li>Bundler</li>
<li>Ruby, Rubygems (see Gemfile for other dependencies)</li>
<li>Selenium ChromeDriver: http://chromedriver.storage.googleapis.com/</li>
</ol>
