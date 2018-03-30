Binda::Api::Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  connection :structures, Binda::Api::Fields::StructuresField
  connection :components, Binda::Api::Fields::ComponentsField
  connection :components_by_structure, Binda::Api::Fields::ComponentsByStructureField
  
  field :component_by_slug, Binda::Api::Fields::ComponentBySlugField
end
