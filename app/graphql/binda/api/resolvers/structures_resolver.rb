class Binda::Api::Resolvers::StructuresResolver
  def call(obj, args, ctx = {})
    Binda::Structure.all
  end
end
