require 'selenium-webdriver'
require 'rubygems'
require 'webdrivers'

class DockerPage
  def loginAsUser
    $driver.navigate.to 'http://automationpractice.com/index.php'
  end

  def navigateToPages
    sleep 3
    $driver.find_element(:xpath, "//a[@title='Log in to your customer account']").click
    sleep 5
    $driver.find_element(:id, 'email').send_keys 'testing username'
    $driver.find_element(:id, 'passwd').send_keys 'testing passwprd'
    $driver.find_element(:id, 'SubmitLogin').click
  end

  def navigateToHome
    sleep 3
    $driver.find_element(:xpath, "//a[@title='Log in to your customer account']").click
    sleep 5
    $driver.find_element(:id, 'email').send_keys 'testing username'
    $driver.find_element(:id, 'passwd').send_keys 'testing passwprd'
    $driver.find_element(:id, 'SubmitLogin').click
  end

  def signOnWeb
    $driver.quit
  end
end
