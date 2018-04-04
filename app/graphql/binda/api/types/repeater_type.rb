require 'binda/api/fields'

Binda::Api::Types::RepeaterType = GraphQL::ObjectType.define do |context|
  name 'Binda_Repeater'
  ::Binda::Api::Fields::SHARED_FIELDS.call(context)
end
