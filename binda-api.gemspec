$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "binda/api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "binda-api"
  s.version     = Binda::Api::VERSION
  s.authors     = ["Marco Crepaldi"]
  s.email       = ["marco.crepaldi@gmail.com"]
  s.homepage    = "http://lacolonia.studio"
  s.summary     = "Binda plugin that adds a GraphQL api to your applicaiton"
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails",                          "~> 5.1"
  s.add_dependency "binda",                          "~> 0.1.9"
  s.add_dependency "graphql",                        "~> 1.8"
  # avoid graphiql-rails 1.5 until this issue is fixed
  # https://github.com/rmosolgo/graphiql-rails/issues/58
  s.add_dependency "graphiql-rails",                 "~> 1.4",  "< 1.5"
  s.add_dependency 'rack-cors',                      "~> 1.0"
  s.add_dependency 'deface',                         "~> 1.3"

  s.add_development_dependency 'pg',                 "~> 1.0"
  s.add_development_dependency 'rspec-rails',        ">= 3.5",  "< 3.8"
  s.add_development_dependency 'byebug',             "~> 10.0"
  s.add_development_dependency "factory_bot_rails",  "~> 4.8"
  s.add_development_dependency 'database_cleaner',   ">= 1.6",  "< 2"
end
