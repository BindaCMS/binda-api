Binda::Api::Fields::RepeatersField = GraphQL::Field.define do
  name 'repeaters'
  type Binda::Api::Types::RepeaterType

  argument :slug, !types.String
  argument :component, !types.String

  resolve(Binda::Api::Resolvers::RepeatersResolver.new)
end

