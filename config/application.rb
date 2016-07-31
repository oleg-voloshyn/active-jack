require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActiveJack
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.yml').to_s]
    config.i18n.available_locales = [:ua, :ru, :en]
    config.i18n.default_locale = :ua
  end
end

Rails.application.secrets.each { |key, value| ENV[key.to_s] ||= value }
