require_relative "spec_helper"

describe "Appium Test" do
  it "should test the app" do
  	# populate text fields with values
  	field_one = @driver.find_element(:accessibility_id, "TextField1")

    for i in 1..100
      field_one.send_keys("12345567890")
      field_one.clear()
    end

  end
end
