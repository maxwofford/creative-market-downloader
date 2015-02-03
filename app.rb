require 'selenium-webdriver'
require_relative 'config'

def sign_in(driver)
  driver.find_element(:id, 'input-username').send_keys(CM_USERNAME)
  driver.find_element(:id, 'input-password').send_keys(CM_PASSWORD)
  driver.find_element(:id, 'input-password').submit
end

driver = Selenium::WebDriver.for :firefox
driver.navigate.to 'https://creativemarket.com/sign-in?r=%2Ffree-goods'
sign_in(driver)
elements = driver.find_elements(:class, 'btn-download')
elements.each { |element| element.click}
driver.quit
