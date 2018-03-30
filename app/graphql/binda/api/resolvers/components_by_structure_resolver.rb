class Binda::Api::Resolvers::ComponentsByStructureResolver
  def call(obj, args, ctx = {})
    Binda::Component.includes(:structure).where(binda_structures: { slug: args[:slug] })
  end
end
