class Binda::Api::Resolvers::ComponentsResolver
  def call(obj, args, ctx = {})
    query_params = args.to_h.symbolize_keys
    structure_slug = query_params.delete(:structure_slug)
    
    components = Binda::Component.where query_params
    if structure_slug
      components = components.includes(:structure).where(binda_structures: { slug: structure_slug })
    end

    components.page
  end
end
