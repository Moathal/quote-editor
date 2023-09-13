ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  Capybara.register_driver :selenium_brave do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new
    browser_options.binary = '/mnt/c/Program Files/BraveSoftware/Brave-Browser/Application/brave.exe' # replace with your browser path
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  end
end
