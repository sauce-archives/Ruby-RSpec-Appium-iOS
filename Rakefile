require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task default: :test_sauce

task :parallel_run do
  system 'parallel_rspec spec'
end

task :iPhone_6_Plus_Simulator do
  ENV['deviceName'] = 'iPhone 6 Plus'
  ENV['platformName'] = 'iOS'
  ENV['platformVersion'] = '8.4'
  ENV['app'] = 'https://s3.amazonaws.com/appium/TestApp8.4.app.zip'
  Rake::Task[:parallel_run].execute
end

task :iPhone_6_Simulator do
  ENV['deviceName'] = 'iPhone 6'
  ENV['platformName'] = 'iOS'
  ENV['platformVersion'] = '8.4'
  ENV['app'] = 'https://s3.amazonaws.com/appium/TestApp8.4.app.zip'
  Rake::Task[:parallel_run].execute
end

multitask :test_sauce => [
    :iPhone_6_Plus_Simulator,
    :iPhone_6_Simulator
] do
  puts 'Running automation'
end

