require './page_classes/red_hat_page'

class LandingPage < RedHatPage
  def self.check_buttons(num_buttons, button_text)
    learn_more_xpath = "//a[contains(text(),'#{button_text}') and contains(@class,'cta-primary')]"

    # assert that there is at least one "Learn more" button with the cta-primary stile
    ($driver.find_elements(:xpath => learn_more_xpath).size >= num_buttons.to_i).should == true
  end
end