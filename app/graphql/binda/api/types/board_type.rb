require 'binda/api/fields'

Binda::Api::Types::BoardType = GraphQL::ObjectType.define do |context|
  name "Binda_Board"
  ::Binda::Api::Fields::SHARED_FIELDS.call(context)
end
