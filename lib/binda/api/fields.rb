module Binda
  module Api
    module Fields
      SHARED_FIELDS = Proc.new do |context|
        context.field :get_related_components, ::Binda::Api::Types::ComponentType.to_list_type do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_related_components(args[:slug])
          }
        end

        context.field :get_related_boards, ::Binda::Api::Types::BoardType.to_list_type do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_related_boards(args[:slug])
          }
        end

        context.field :get_string, ::Binda::Api::Types::TextType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            begin
              obj.get_string(args[:slug])
            rescue ArgumentError
              ""
            end
          }
        end

        context.field :get_text, ::Binda::Api::Types::TextType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            begin
              obj.get_text(args[:slug])
            rescue ArgumentError
              ""
            end
          }
        end 

        context.field :get_radio_choice, ::Binda::Api::Types::RadioType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_radio_choice(args[:slug])
          }
        end

        context.field :get_checkbox_choices, ::Binda::Api::Types::CheckboxType.to_list_type do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_checkbox_choices(args[:slug])
          }
        end

        context.field :get_selection_choice, ::Binda::Api::Types::SelectionType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.get_selection_choice(args[:slug])
          }
        end 

        context.field :get_image, ::Binda::Api::Types::ImageType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.images.find{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end

        context.field :get_audio, ::Binda::Api::Types::AudioType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.audios.find{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end

        context.field :get_video, ::Binda::Api::Types::VideoType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.videos.find{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end 

        context.field :get_svg, ::Binda::Api::Types::SvgType do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.svgs.find{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end

        context.field :repeaters, ::Binda::Api::Types::RepeaterType.to_list_type do
          argument :slug, !context.types.String

          resolve ->(obj, args, ctx) {
            obj.repeaters.order("binda_repeaters.position").select{ |t| t.field_setting_id == ::Binda::FieldSetting.get_id( args[:slug] ) }
          }
        end
      end
    end
  end
end
