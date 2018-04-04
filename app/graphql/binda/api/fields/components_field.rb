Binda::Api::Fields::ComponentsField = GraphQL::Field.define do
  name 'components'

  argument :slug, types.String.to_list_type
  argument :structure_slug, types.String
  argument :publish_state, types.String

  type Binda::Api::Types::ComponentType.connection_type

  resolve(Binda::Api::Resolvers::ComponentsResolver.new)
end
