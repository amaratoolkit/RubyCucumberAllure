require 'pry'
require 'allure-cucumber'
require 'rubygems'
require 'magic_encoding'

Before do |scenario|
  @tags = scenario.source_tag_names.first # @tags instance variable accessible in test
  log '@tags'

  $driver = Selenium::WebDriver.for :safari
  # To execute on docker
  # caps = Selenium::WebDriver::Remote::Capabilities.send('chrome')

  # $driver = Selenium::WebDriver.for(:remote, url: 'http://192.168.1.4:4444/wd/hub', desired_capabilities: caps)
  # To execute on browserstack
  # $driver = Selenium::WebDriver.for(:remote, url: 'http://siva518:UQZfAXgr43CUqsZKxhF6@hub.browserstack.com:80/wd/hub', desired_capabilities: caps)
  $driver.manage.window.maximize
  $driver.navigate.to 'http://automationpractice.com/index.php'
end

def take_screen_shot
  test_folder = "tests_results_#{DateTime.now.strftime('%d-%m-%Y')}/screenshots"

  FileUtils.mkdir_p(test_folder) unless File.directory?(test_folder)

  screenshot = "#{test_folder}/#{@tags}-#{DateTime.now.strftime('%d-%m-%Y-%H-%M')}.png"

  begin
    $driver.save_screenshot(screenshot)
  rescue StandardError
    $driver.screenshot(screenshot)
  rescue StandardError
    @browser.driver.save_screenshot(screenshot)
  end

  $driver.screenshot_as(:base64)
  attach(screenshot.to_s, 'image/png')

  Allure.add_attachment(name: @tags, source: $driver.save_screenshot(screenshot), type: Allure::ContentType::PNG, test_case: true)
  Allure.add_attachment(name: @tags, source: $driver.save_screenshot(screenshot), type: Allure::ContentType::PNG, test_case: false)
end

After do |test|
  log "docker: #{test.passed? ? 'PASSED' : 'FAILED'}"
  take_screen_shot # screen shot function
  $driver.quit
end

at_exit do
  puts 'Cucumber has finished.'
end

AfterConfiguration do |config|
  config.on_event :test_step_started do |step|
    step_name = step.test_step.to_s
    puts "#{step_name} - STARTED"
  end
end
