require 'binda/api/fields'

Binda::Api::Types::CheckboxType = GraphQL::ObjectType.define do
  name 'Binda_Checkbox'

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
