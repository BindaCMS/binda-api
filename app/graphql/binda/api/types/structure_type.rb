Binda::Api::Types::StructureType = GraphQL::ObjectType.define do |context|
  name "Binda_Structure"

  field :id, !types.ID
  field :name, !types.String

  context.field :get_categories, ::Binda::Api::Types::CategoryType.to_list_type do 
    resolve ->(obj, args, ctx) {
      obj.categories.order("binda_categories.position")
    }
  end
end
