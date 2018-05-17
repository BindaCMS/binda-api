Binda::Api::Types::SvgType = GraphQL::ObjectType.define do
  name 'Binda_Svg'

  field :svg, types.String do
    resolve ->(obj, args, ctx) do
      obj.svg.url
    end
  end
end

