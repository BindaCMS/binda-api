Binda::Api::Types::ComponentType = GraphQL::ObjectType.define do
  name "Binda_Component"

  field :id, types.ID
  field :name, types.String
  field :slug, types.String
  field :publish_state, types.String

  field :structure, Binda::Api::Types::StructureType

  field :get_string, Binda::Api::Types::TextType do
    argument :slug, !types.String

    resolve ->(obj, args, ctx) {
      obj.get_string(args[:slug])
    }
  end

  field :get_text, Binda::Api::Types::TextType do
    argument :slug, !types.String

    resolve ->(obj, args, ctx) {
      obj.get_text(args[:slug])
    }
  end

  field :get_radio, Binda::Api::Types::RadioType do
    argument :slug, !types.String

    resolve ->(obj, args, ctx) {
      obj.get_radio_choice(args[:slug])
    }
  end

  field :get_image, Binda::Api::Types::ImageType do
    argument :slug, !types.String

    resolve ->(obj, args, ctx) {
      obj.images.find{ |t| t.field_setting_id == Binda::FieldSetting.get_id( args[:slug] ) }
    }
  end
end
