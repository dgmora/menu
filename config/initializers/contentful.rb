# frozen_string_literal: true

ContentfulRails.configure do |config|
  config.authenticate_webhooks = false
  # config.webhooks_username = "a basic auth username"
  # config.webhooks_password = "a basic auth password"
  contentful_config = Rails.application.credentials.fetch(:contentful)
  config.access_token = contentful_config.fetch(:access_token)
  # config.preview_access_token = "your preview access token"
  # config.management_token = "your management access token"
  config.space = contentful_config.fetch(:space_id)
  config.environment = 'master'
end
