require 'selenium/webdriver'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'

RSpec.configure do
  Capybara.server = :puma
  Capybara.server_port = 5000

  Capybara.register_driver(:chrome) do |app|
    chrome_args = %w[window-size=1024,768]
    chrome_args += %w[headless disable-gpu] unless ENV['TEST_CARTOON']

    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
        chromeOptions: { args: chrome_args }
    )

    Capybara::Selenium::Driver.new(
        app,
        browser: :chrome,
        desired_capabilities: capabilities
    )
  end

  Capybara::Screenshot.register_driver(:chrome) do |driver, path|
    driver.browser.save_screenshot(path)
  end

  Capybara.javascript_driver = :chrome
end