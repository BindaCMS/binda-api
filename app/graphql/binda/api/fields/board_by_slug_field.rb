Binda::Api::Fields::BoardBySlugField = GraphQL::Field.define do
  name 'boardBySlug'
  type Binda::Api::Types::BoardType

  argument :slug, !types.String

  resolve(Binda::Api::Resolvers::BoardBySlugResolver.new)
end
