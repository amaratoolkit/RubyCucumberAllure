require 'allure-cucumber'
require 'rubygems'
require 'pry'

# Allure
AllureCucumber.configure do |c|
  c.results_directory = 'report/allure-results'
  c.clean_results_directory = true
  c.logging_level = Logger::INFO
  c.link_tms_pattern = 'https://example.org/tms/{}'
  c.link_issue_pattern = 'https://example.org/issue/{}'
  c.tms_prefix = 'TMS_'
  c.issue_prefix = 'ISSUE_'
end

AllureCucumber.configure do |config|
  config.tms_prefix = 'HIPTEST--'
  config.issue_prefix = 'JIRA++'
  config.severity_prefix = 'URGENCY:'
end
