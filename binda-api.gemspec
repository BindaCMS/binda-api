$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "binda/api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "binda-api"
  s.version     = Binda::Api::VERSION
  s.authors     = ["Marco Crepaldi"]
  s.email       = ["marco.crepaldi@gmail.com"]
  s.homepage    = "Binda::Api"
  s.summary     = "Binda plugin that adds a GraphQL api to your applicaiton"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.5"
  s.add_dependency "binda", "~> 0.1"
  s.add_dependency "graphql",              "1.8.0.pre6"
  s.add_dependency "graphiql-rails",       "~> 1.4"
  s.add_dependency 'pg'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'byebug'
  s.add_development_dependency "factory_bot_rails",           "~> 4.8"
  s.add_development_dependency 'database_cleaner'
end
