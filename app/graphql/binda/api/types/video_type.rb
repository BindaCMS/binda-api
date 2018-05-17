Binda::Api::Types::VideoType = GraphQL::ObjectType.define do
  name 'Binda_Video'

  field :video, types.String do
    resolve ->(obj, args, ctx) do
      obj.video.url
    end
  end

  field :content_type, types.String do
    resolve ->(obj, args, ctx) do
      obj.content_type
    end
  end

  field :file_size, types.String do
    resolve ->(obj, args, ctx) do
      obj.file_size
    end
  end

end
