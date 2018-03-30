Binda::Api::Types::RadioType = GraphQL::ObjectType.define do
  name 'Binda_Radio'

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
