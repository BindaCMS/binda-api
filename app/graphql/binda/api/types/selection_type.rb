Binda::Api::Types::SelectionType = GraphQL::ObjectType.define do
  name 'Binda_Selection'

  field :value, types.String do
    resolve ->(obj, args, ctx) do
      obj[:value]
    end
  end

  field :label, types.String do
    resolve ->(obj, args, ctx) do
      obj[:label]
    end
  end

end
