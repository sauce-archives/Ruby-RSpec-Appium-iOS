require_relative "spec_helper"

describe "Appium Test" do
  it "should test the app" do
  	# populate text fields with values
  	field_one = @driver.find_element(:accessibility_id, "TextField1")
  	field_one.send_keys("12")

  	field_two = @driver.find_elements(:class_name, "UIATextField")[1]
  	field_two.send_keys("8")

  	# trigger computation by using the button
    @driver.find_element(:accessibility_id, "ComputeSumButton").click();

    # is sum equal?
    sum = @driver.find_element(:class_name, "UIAStaticText").text();
    expect(Integer(sum)).to eq(20)

  end
end
