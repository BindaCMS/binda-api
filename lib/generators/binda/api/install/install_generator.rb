module Binda
  module Api
    class InstallGenerator < Rails::Generators::Base
      def run_migrations
        puts ""
        puts "==============================================================================="
        puts "                             BINDA API INSTALLATION"
        puts "==============================================================================="
        puts ""
        puts "1) Install migrations"
        # Check if there is any previous Binda migration
        previous_binda_api_migrations = Dir.glob( Rails.root.join('db', 'migrate', '*.binda_api.rb' ))
        previous_migrations = Dir.glob( Rails.root.join('db', 'migrate', '*.rb' ))

        # If it's the first time you run the installation
        unless previous_binda_api_migrations.any?
          rake 'binda_api:install:migrations'
        else
          # If there is any previous Binda migration
          if previous_migrations.size != previous_binda_api_migrations.size
            warn "You have several migrations, please manually delete Binda's ones then run 'rails g binda:api:install' again."
            warn "Keep in mind that Binda API will place the new migration after the existing ones."
            exit
          else
            # Remove previous Binda API migrations
            FileUtils.rm_rf( previous_binda_migrations )
            # Install Binda API migrations
            rake 'binda_api:install:migrations'
          end
        end
        rake 'db:migrate'
      end
    end
  end
end
