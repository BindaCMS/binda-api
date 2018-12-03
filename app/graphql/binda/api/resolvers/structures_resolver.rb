class Binda::Api::Resolvers::StructuresResolver
  def call(obj, args, ctx = {})
    user = ctx[:current_user]
    return [] if user.nil?
    user.structures
  end
end
