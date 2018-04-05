class Binda::Api::Resolvers::RepeatersResolver
  def call(obj, args, ctx = {})
    repeaters = Binda::Repeater.includes(:field_setting).where(binda_field_settings: { slug: args[:slug] })
    repeaters.select{|r| r.fieldable.slug == args[:component] }
  end
end
