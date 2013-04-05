require 'simplecov'
SimpleCov.start do
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Views', 'app/views'
  add_group 'Libraries', 'lib'
end

ENV["RAILS_ENV"] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rspec/rails'
require 'ffaker'
require 'database_cleaner'
require 'i18n-spec'

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path('../dummy/db/migrate/', __FILE__)

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/url_helpers'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Spree::TestingSupport::UrlHelpers

  config.color = true
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.fail_fast = ENV['FAIL_FAST'] || false

  config.before do
    if example.metadata[:js]
      DatabaseCleaner.strategy = :truncation
    else
      DatabaseCleaner.strategy = :transaction
    end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
end
