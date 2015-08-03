class Validation
  def self.visible?(webElement)
    return(webElement.displayed? && webElement.enabled?)
  end

  def self.valid_image?(webElement)
    return $driver.execute_script("return arguments[0].complete " +
                                      "&& typeof arguments[0].naturalWidth != \"undefined\" " +
                                      "&& arguments[0].naturalWidth > 0", webElement);
  end
end