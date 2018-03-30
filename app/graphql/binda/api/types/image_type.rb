Binda::Api::Types::ImageType = GraphQL::ObjectType.define do
  name 'Binda_Image'

  field :image, types.String do
    resolve ->(obj, args, ctx) do
      obj.image
    end
  end

  field :thumb, types.String do
    resolve ->(obj, args, ctx) do
      obj.image.thumb
    end
  end

  field :width, types.String do
    resolve ->(obj, args, ctx) do
      obj.file_width.to_i
    end
  end

  field :height, types.String do
    resolve ->(obj, args, ctx) do
      obj.file_height.to_i
    end
  end

end
