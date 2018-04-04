require 'binda/api/fields'

Binda::Api::Types::ComponentType = GraphQL::ObjectType.define do |context|
  name "Binda_Component"
  ::Binda::Api::Fields::SHARED_FIELDS.call(context)
end
