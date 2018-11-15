Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
end

Binda::Engine.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  resources :api_users
end
