require 'selenium-webdriver'
require_relative 'config'

def is_flag_on?(flag)
  ARGV.include?(flag)
end

def sign_in(driver)
  puts 'signing in'
  driver.find_element(:id, 'input-username').send_keys(CM_USERNAME)
  driver.find_element(:id, 'input-password').send_keys(CM_PASSWORD)
  driver.find_element(:id, 'input-password').submit
  puts 'signed in'
end

if is_flag_on?("--firefox")
  driver = Selenium::WebDriver.for :firefox
else
  driver = Selenium::WebDriver.for :phantomjs
  driver.manage.window.resize_to(1000, 1000)
end

driver.navigate.to 'https://creativemarket.com/sign-in?r=%2Ffree-goods'
sign_in(driver)
elements = driver.find_elements(:class, 'btn-download')
puts 'clicking the things'
elements.each { |element| element.click}
driver.quit
