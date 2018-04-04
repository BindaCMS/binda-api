require 'binda'
require 'graphql'
require 'graphiql/rails'

module Binda
  module Api
    class Engine < ::Rails::Engine
      isolate_namespace Binda::Api
    end
  end
end
