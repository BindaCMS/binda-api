class Binda::Api::Resolvers::ComponentsByStructureResolver
  def call(obj, args, ctx = {})
    structure_ids = user.structures.where(slug: structure_slug).pluck(:id)
    Binda::Component.where( structure_id: structure_ids )
                    .order('binda_components.position ASC')
  end
end
