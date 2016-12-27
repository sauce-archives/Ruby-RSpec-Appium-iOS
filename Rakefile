require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task default: :test_sauce

task :parallel_run do
  ENV['app'] = 'https://github.com/saucelabs-sample-test-frameworks/GuineaPig-Sample-App/blob/master/iOS/simulator/GuineaPig-sim-debug.app.zip'
  ENV['deviceOrientation'] = 'portrait'
  ENV['platformName'] = 'iOS'

  system 'parallel_split_test spec'
end

task :iPad_Air_2_Simulator do
  ENV['deviceName'] = 'iPad Air 2 Simulator'
  ENV['platformVersion'] = '9.3'
  ENV['appiumVersion'] = '1.6.3'

  Rake::Task[:parallel_run].execute
end

task :iPhone_7_Simulator do
  ENV['deviceName'] = 'iPhone 7 Simulator'
  ENV['platformVersion'] = '10.0'
  ENV['appiumVersion'] = '1.6.3'

  Rake::Task[:parallel_run].execute
end

task :iPhone_6_Device do
  caps['deviceName'] = 'iPhone 6s Device'
  caps['platformVersion'] = '9.3'
  caps['appiumVersion'] = '1.5.3'

  Rake::Task[:parallel_run].execute
end

multitask :test_sauce => [
    :iPad_Air_2_Simulator,
    # Real Device Not Implemented
    #:iPhone_6_Device,
    :iPhone_7_Simulator
] do
  puts 'Running automation'
end
