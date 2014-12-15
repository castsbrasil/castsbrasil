require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyCastsBrasil
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'br'

    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

    config.assets.precompile << Proc.new do |path|
      if path =~ /\.(css|js)\z/
        full_path = Rails.application.assets.resolve(path).to_path
        app_assets_path = Rails.root.join('app', 'assets').to_path
        if full_path.starts_with? app_assets_path
          puts "including asset: " + full_path
          true
        else
          puts "excluding asset: " + full_path
          false
        end
      else
        false
      end
    end

    config.generators do |g|
      g.test_framework  :rspec, fixture: false
      g.view_specs      false
      g.helper_specs    false
    end
  end
end
