require 'binda/api/fields'

Binda::Api::Types::RepeaterType = GraphQL::ObjectType.define do |context|
  name 'Binda_Repeater'
  context.field :position, context.types.Int

  ::Binda::Api::Fields::SHARED_FIELDS.call(context)
end
