require 'spec_helper'
require 'capybara/rails'

Capybara.default_driver = :selenium
module ActionController
  class IntegrationTest
    include Capybara::DSL
  end
end

