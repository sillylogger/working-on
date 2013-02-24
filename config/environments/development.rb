WorkingOn::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL).
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  config.assets.debug = true

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  config.action_controller.asset_host =       'http://localhost:3000'
  config.action_mailer.asset_host =           'http://localhost:3000'
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Bo chup if the mailer can't send
  config.action_mailer.delivery_method = :test
  #  config.action_mailer.raise_delivery_errors = true
  #  config.action_mailer.delivery_method = :smtp
  #  config.action_mailer.smtp_settings = {
  #    address: "smtp.gmail.com",
  #    port: 587,
  #    domain: "gmail.com",
  #    tls: true,
  #    authentication: "plain",
  #    enable_starttls_auto: true,
  #    user_name: "tommy.b.sullivan@gmail.com",
  #    password: ""
  #  }
end
