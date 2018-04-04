class Binda::Api::Resolvers::ComponentsResolver
  def call(obj, args, ctx = {})
    query_params = args.to_h.symbolize_keys
    query_params.reject!{|k,v| [:first, :last, :after, :before].include? k }
    structure_slug = query_params.delete(:structure_slug)
    
    components = Binda::Component.where query_params
    if structure_slug
      components = components.includes(:structure).where(binda_structures: { slug: structure_slug })
    end

    components.order('binda_components.position ASC')
  end
end
