require './helpers/validation'
require 'rspec'

class SecondaryTopMenu
  def self.check_content
    ## links in the secondary nav: assume the element with id 'second-menu' will remain static
    @customers_xpath = "//*[@id='second-menu']/descendant::a[contains(@href,'/customers')]"
    customers_element = $driver.find_element(:xpath => @customers_xpath)
    Validation.visible?(customers_element).should == true

    @partners_xpath = "//*[@id='second-menu']/descendant::a[contains(@href,'/partners')]"
    partners_element = $driver.find_element(:xpath => @partners_xpath)
    Validation.visible?(partners_element).should == true

    @open_source_xpath = "//*[@id='second-menu']/descendant::a[contains(@href,'/open-source')]"
    open_source_element = $driver.find_element(:xpath => @open_source_xpath)
    Validation.visible?(open_source_element).should == true

    ## expandable anchors in the secondary nav: look for 'expand' in the class
    @expand_search_xpath = "//*[@id='second-menu']/descendant::*[@id='utility-search']/descendant::a[contains(@class,'expand')]"
    expand_search_element = $driver.find_element(:xpath => @expand_search_xpath)
    Validation.visible?(expand_search_element).should == true

    @expand_login_xpath = "//*[@id='second-menu']/descendant::*[@id='utility-account']/descendant::a[contains(@class,'expand')]"
    expand_login_element= $driver.find_element(:xpath => @expand_login_xpath)
    Validation.visible?(expand_login_element).should == true

    @expand_globe_xpath = "//*[@id='second-menu']/descendant::*[@id='utility-globe']/descendant::a[contains(@class,'expand')]"
    expand_globe_element= $driver.find_element(:xpath => @expand_globe_xpath)
    Validation.visible?(expand_globe_element).should == true
  end

  def self.check_and_return_link(expected_link_text, redirection_uri)
    link_xpath = "//*[@id='second-menu']/descendant::a[contains(text(),'#{expected_link_text}')]"
    link_element = $driver.find_element(:xpath => link_xpath)
    link_element.attribute('href').include?(redirection_uri).should == true
    return link_element
  end
end