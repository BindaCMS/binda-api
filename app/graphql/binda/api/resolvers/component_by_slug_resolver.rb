class Binda::Api::Resolvers::ComponentBySlugResolver
  def call(obj, args, ctx = {})
    Binda::Component.find_by! slug: args[:slug]
  end
end
