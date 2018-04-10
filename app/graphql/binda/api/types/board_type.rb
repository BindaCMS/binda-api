require 'binda/api/fields'

Binda::Api::Types::BoardType = GraphQL::ObjectType.define do |context|
  name "Binda_Board"
  context.field :id, context.types.ID
  context.field :name, context.types.String
  context.field :slug, context.types.String
  context.field :position, context.types.Int

  ::Binda::Api::Fields::SHARED_FIELDS.call(context)
end
