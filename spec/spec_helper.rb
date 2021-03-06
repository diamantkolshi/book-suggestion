require "bundler/setup"
::Bundler.require(:default, :test)

require "shoulda/matchers"
::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    #with.test_framework :minitest
    #with.test_framework :minitest_4
    #with.test_framework :test_unit

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    #with.library :action_controller
    # Or, choose the following (which implies all of the above):
    #with.library :rails
  end
end


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end