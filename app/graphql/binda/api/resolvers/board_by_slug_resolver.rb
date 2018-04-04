class Binda::Api::Resolvers::BoardBySlugResolver
  def call(obj, args, ctx = {})
    Binda::Board.find_by! slug: args[:slug]
  end
end
