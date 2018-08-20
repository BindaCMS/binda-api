class Binda::Api::Resolvers::RepeatersResolver
  def call(obj, args, ctx = {})
    user = ctx[:current_user]
    return [] if user.nil?
    repeaters = Binda::Repeater.includes(:field_setting).where(binda_field_settings: { slug: args[:slug] }).order(:position)
    repeaters.select{|r| r.fieldable.slug == args[:fieldable_slug] }
  end
end
