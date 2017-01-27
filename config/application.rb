require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Eaves
  class Application < Rails::Application
    config.autoload_paths << "#{Rails.root}/app/services"

    config.action_view.field_error_proc = proc { |tag|
      "<span class='input--error'>#{tag}</span>".html_safe
    }

    config.generators do |generate|
      generate.stylesheets false
      generate.javascripts false
      generate.helpers false
    end

    config.middleware.insert_before 0, 'Rack::Cors' do
      allow do
        origins '*'
        resource '/api/*', headers: :any, methods: %i(options get put post)
      end
    end
  end
end
