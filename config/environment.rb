# frozen_string_literal:true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize! do

config.action_mailer.delivery_method = :smtp
config.action_mailer.default_url_options = { host: 'localhost:3000' }

end
