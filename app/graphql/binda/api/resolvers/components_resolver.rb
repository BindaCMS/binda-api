class Binda::Api::Resolvers::ComponentsResolver
  def call(obj, args, ctx = {})
    query_params = args.to_h.symbolize_keys
    query_params.reject!{|k,v| [:first, :last, :after, :before].include? k }
    structure_slug = query_params.delete(:structure_slug)
    user = ctx[:current_user]
    return [] if user.nil?
    
    if structure_slug
      structures = user.structures.where(slug: structure_slug)
    else
      structures = user.structures
    end

    Binda::Component.where( structure_id: structures.map(&:id) )
                    .where(query_params)
                    .order('binda_components.position ASC')
  end
end
