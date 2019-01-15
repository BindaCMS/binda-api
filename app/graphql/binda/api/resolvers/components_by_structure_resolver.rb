class Binda::Api::Resolvers::ComponentsByStructureResolver
  def call(obj, args, ctx = {})
    user = ctx[:current_user]
    query_params = args.to_h.symbolize_keys
    query_params.reject!{|k,v| [:first, :last, :after, :before].include? k }
    structure_slug = query_params.delete(:structure_slug)
    structure_ids = user.structures.where(slug: structure_slug).pluck(:id)

    Binda::Component.where( structure_id: structure_ids )
                    .order('binda_components.position ASC')
  end
end
