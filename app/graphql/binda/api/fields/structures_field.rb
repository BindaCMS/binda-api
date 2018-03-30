Binda::Api::Fields::StructuresField = GraphQL::Field.define do
  name 'structures'
  type Binda::Api::Types::StructureType.connection_type

  resolve(Binda::Api::Resolvers::StructuresResolver.new)
end
