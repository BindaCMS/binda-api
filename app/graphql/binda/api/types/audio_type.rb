Binda::Api::Types::AudioType = GraphQL::ObjectType.define do
  name 'Binda_Audio'

  field :audio, types.String do
    resolve ->(obj, args, ctx) do
      obj.audio.url
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
