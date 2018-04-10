require 'binda/api/fields'

Binda::Api::Types::ComponentType = GraphQL::ObjectType.define do |context|
  name "Binda_Component"
  context.field :id, context.types.ID
  context.field :name, context.types.String
  context.field :slug, context.types.String
  context.field :publish_state, context.types.String
  context.field :structure, ::Binda::Api::Types::StructureType
  context.field :position, context.types.Int

  ::Binda::Api::Fields::SHARED_FIELDS.call(context)
end
