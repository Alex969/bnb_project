ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'setup_test_db'
require 'features/web_helpers'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start

Capybara.app = BnB

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
