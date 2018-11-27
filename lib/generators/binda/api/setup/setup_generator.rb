# require 'securerandom'

module Binda
  module Api
    # Setup initial settings for the gem.
    #
    # Setting up a user is mandatory otherwise you won't be able to
    #   obtain any data from your requests. Running `rails generate binda:api:setup`
    #   will populate the application database with new default settings.
    class SetupGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_credentials
        puts "1) Create a API user"
        ::Binda::ApiUser.create_api_user
        puts
      end

      def feedback
        puts "==============================================================================="
        puts
        puts "                 Binda API has been successfully set up! "
        puts
        puts "==============================================================================="
      end

    end
  end
end
