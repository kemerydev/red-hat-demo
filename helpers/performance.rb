class Performance
  def self.click_and_measure_load_time(clickable_element, expected_uri)
    start = Time.now
    clickable_element.click
    $wait.until { $driver.execute_script('return document.readyState').eql?('complete') }
    elapsed = Time.now - start

    $driver.current_url.include?(expected_uri).should == true
    $performance_logger.info(elapsed.round(3).to_s + 's to load ' + expected_uri)
    sleep 0.2
    return elapsed
  end
end