module Binda
  module Api
    module Fields
      SHARED_FIELDS = Proc.new do |context|
        context.field :id, context.types.ID
        context.field :name, context.types.String
        context.field :slug, context.types.String
        context.field :publish_state, context.types.String

        context.field :structure, ::Binda::Api::Types::StructureType

        context.field :get_string, ::Binda::Api::Types::TextType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_string(args[:slug])
          }
        end

        context.field :get_text, ::Binda::Api::Types::TextType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_text(args[:slug])
          }
        end

        context.field :get_radio, ::Binda::Api::Types::RadioType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_radio_choice(args[:slug])
          }
        end

        context.field :get_image, ::Binda::Api::Types::ImageType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.images.find{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end

        context.field :get_repeater_items, ::Binda::Api::Types::RepeaterType.to_list_type do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.repeaters.select{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end
      end
    end
  end
end
