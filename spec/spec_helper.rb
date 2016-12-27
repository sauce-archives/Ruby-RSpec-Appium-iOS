require "appium_lib"
require "rspec"
require "sauce_whisk"

RSpec.configure do | config |
  config.before(:each) do |example|
    capabilities = {
        platformVersion: ENV['platformVersion'],
        deviceName: ENV['deviceName'],
        platformName: 'iOS',
        app: ENV['app'],
        deviceOrientation: 'portrait',
        name: example.full_description,
        appiumVersion: ENV['appiumVersion'],
        build: ENV['BUILD_TAG'] || "Unknown Build",
    }

    @driver = Appium::Driver.new(caps: capabilities)
    @driver.start_driver
  end

  config.after(:each) do |example|
   session_id = @driver.session_id
   @driver.driver_quit
   SauceWhisk::Jobs.change_status(session_id, example.exception.nil?)
  end
end
