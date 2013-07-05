# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Rails.logger.level = 4

RSpec.configure do |config|

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  # helpers for factories, cleaning up the db
  config.include FactoryGirl::Syntax::Methods
  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  # helpers for login
  config.include Devise::TestHelpers,           type: :controller
  config.include Capybara::PageHelpers,         type: :feature
  config.include Warden::Test::Helpers,         type: :feature
  config.before(:each, type: :feature) { Warden.test_mode! }
  config.after(:each, type: :feature) { Warden.test_reset! }

  # I'm going to render the views until I have 500 controller specs.
  # Re-evaluate then
  config.render_views

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

end

Capybara.javascript_driver = :webkit
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
