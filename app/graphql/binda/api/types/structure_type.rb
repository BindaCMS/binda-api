Binda::Api::Types::StructureType = GraphQL::ObjectType.define do
  name "Binda_Structure"

  field :id, !types.ID
  field :name, !types.String
end
