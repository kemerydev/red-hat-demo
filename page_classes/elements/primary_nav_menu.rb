class PrimaryNavMenu
  def self.check_content
    #if the locators are prone to change, put partial xpaths in class variables then construct locators from concatenating them

    # like: @main_nav_xpath = "//nav[@id='main-nav']"

    #otherwise we keep the full xpath text hard-coded, for easier locator testing with Chrome Developer Tools

    @technologies_xpath = "//nav[@id='main-nav']/descendant::a[contains(text(),'Technologies')]"
    technologies_element = $driver.find_element(:xpath => @technologies_xpath)
    Validation.visible?(technologies_element).should == true

    @services_support_xpath = "//nav[@id='main-nav']/descendant::a[contains(text(),'Services & support')]"
    services_support_element = $driver.find_element(:xpath => @services_support_xpath)
    Validation.visible?(services_support_element).should == true

    @success_stories_xpath = "//nav[@id='main-nav']/descendant::a[contains(text(),'Success stories')]"
    success_stories_element = $driver.find_element(:xpath => @success_stories_xpath)
    Validation.visible?(success_stories_element).should == true

    @about_redhat_xpath = "//nav[@id='main-nav']/descendant::a[contains(text(),'About Red Hat')]"
    about_redhat_element = $driver.find_element(:xpath => @about_redhat_xpath)
    Validation.visible?(about_redhat_element).should == true
  end

  def self.check_and_return_menu_link(expected_link_text, redirection_uri)
    link_xpath = "//div[contains(@class,'menu-items')]/descendant::a[text()='#{expected_link_text}']"
    link_element = $driver.find_element(:xpath => link_xpath)
    Validation.visible?(link_element).should == true
    link_element.attribute('href').include?(redirection_uri).should == true
    return link_element
  end

  def self.open_top_menu(top_link_text)
    top_link_xpath = "//*[contains(@class,'top-level-wrapper')]/descendant::a[contains(text(),'#{top_link_text}')]"
    #top_link_xpath = "//*[@id='main-nav']/descendant::a[contains(text(),'#{expected_link_text}')]"

    # the <li> tag which is the parent of the anchor tag for the top nav links — this has a class 'main-active' only when it is open
    parent_li_xpath = top_link_xpath + "/parent::li[contains(@class,'top-level-wrapper')]"
    top_link = $driver.find_element(:xpath => top_link_xpath)
    parent_li = $driver.find_element(:xpath => parent_li_xpath)
    unless parent_li.attribute('class').include?('main-active')
      top_link.click # open the menu
      sleep 1.2
    else
      top_link.click # close the menu
      sleep 1.2
      top_link = $driver.find_element(:xpath => top_link_xpath)
      top_link.click # open the menu
      sleep 1.2
    end
    parent_li = $driver.find_element(:xpath => parent_li_xpath)
    parent_li.attribute('class').include?('main-active').should == true
  end

  def self.check_explore_button
    explore_button_xpath = "//div[contains(@class,'subnav-open')]//descendant::div[contains(@class,'go-to')]/a"
    explore_button = $driver.find_element(:xpath => explore_button_xpath)
    Validation.visible?(explore_button).should == true
  end

  def self.check_column_header(header_link_text)
    # relative locators like this enforce the page structure and cause tests to fail if page structure changes. wildcards (*) can be used when a tag type may change (e.g. h2 to h3)
    # contains() should always be used when locating by the class attribute in case additional classes are added to the element
    sleep 0.2
    column_header_xpath = "//div[contains(@class,'menu-items')]/descendant::*[contains(@class,'menu')]/preceding-sibling::*/descendant::a[contains(.,'#{header_link_text}')]"
    column_header = $driver.find_element(:xpath => column_header_xpath)
    Validation.visible?(column_header).should == true
  end
end