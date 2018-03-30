Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
end

Binda::Engine.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
