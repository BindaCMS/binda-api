class Binda::Api::Resolvers::BoardBySlugResolver
  def call(obj, args, ctx = {})
    user = ctx[:current_user]
    return {} if user.nil?
    structure = user.structures.find_by instance_type: 'board', slug: args[:slug]
    
    structure.try(:board)
  end
end
