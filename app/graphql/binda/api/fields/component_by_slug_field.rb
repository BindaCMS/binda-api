Binda::Api::Fields::ComponentBySlugField = GraphQL::Field.define do
  name 'componentBySlug'
  type Binda::Api::Types::ComponentType

  argument :slug, !types.String

  resolve(Binda::Api::Resolvers::ComponentBySlugResolver.new)
end

