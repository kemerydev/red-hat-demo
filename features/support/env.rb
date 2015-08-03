require 'selenium-webdriver'
require 'logger'
require 'date'

Before('@initial') do
  # The latest chromedriver can be downloaded from http://chromedriver.storage.googleapis.com/index.html
  Selenium::WebDriver::Chrome.driver_path = "/Users/mollybeaver/Kevin/selenium_demo/chromedriver"
  #Selenium::WebDriver::Chrome.driver_path = "/path/to/selenium_demo/chromedriver"

  $red_hat_url = 'http://www.redhat.com/en'

  $driver = Selenium::WebDriver.for :chrome
  $driver.manage.timeouts.implicit_wait = 10
  $wait = Selenium::WebDriver::Wait.new(:timeout => 10)

  $driver.manage.window.move_to(0, 0)
  max_width, max_height = $driver.execute_script("return [window.screen.availWidth, window.screen.availHeight];")
  $driver.manage.window.resize_to(max_width, max_height)

  current_time = DateTime.now
  #logfilename = current_time.strftime('%d-%m-%Y_%H:%M').concat('.log')
  logfilename = 'standard.log'
  logfile = File.new(logfilename, 'w')
  $logger = Logger.new(logfile)
  $logger.datetime_format = "H:%M:%S"
  $logger.formatter = proc do |severity, datetime, progname, msg|
    "[#{datetime}] #{msg}\n"
  end

  #performance_log_filename = current_time.strftime('%d-%m-%Y_%H:%M').concat('_performance').concat('.log')
  performance_log_filename = 'performance.log'
  $performance_log = File.new(performance_log_filename, 'w')
  #$performance_logger = Logger.new(performance_log)
  #$performance_logger.datetime_format = "H:%M:%S"
  #$performance_logger.formatter = proc do |severity, datetime, progname, msg|
  #  "[#{datetime}] #{msg}\n"
  #end
end

After('@final') do
  $driver.close
  $driver.quit
end