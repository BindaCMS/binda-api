Binda::Api::Fields::ComponentsByStructureField = GraphQL::Field.define do
  name 'componentsByStructure'
  type Binda::Api::Types::ComponentType.connection_type

  argument :slug, types.String
  argument :structure_slug, !types.String
  argument :publish_state, types.String

  resolve(Binda::Api::Resolvers::ComponentsByStructureResolver.new)
end
