require 'binda'
require 'graphql'
require 'graphiql/rails'
require 'rack/cors'

module Binda
  module Api
    class Engine < ::Rails::Engine
      isolate_namespace Binda::Api

      initializer "add_rack_cors_middleware" do |app|
        app.middleware.insert_before 0, Rack::Cors do
          allow do
            origins '*'
            resource '*', :headers => :any, :methods => [:get, :post, :options]
          end
        end
      end
    end
  end
end
