Binda::Api::Types::TextType = GraphQL::ObjectType.define do
  name 'Binda_Text'

  field :value, types.String do
    resolve ->(obj, args, ctx) do
      obj.try(:html_safe)
    end
  end
end

