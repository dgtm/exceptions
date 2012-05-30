# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rspec/rails"
# require "rspec/rails"
# require "database_cleaner"
# require 'capybara/rails'
# require 'capybara/rspec'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # config.use_transactional_fixtures = true
    config.treat_symbols_as_metadata_keys_with_true_values = true
    # config.filter_run :focus => true
end
