Binda::Api::Schema = GraphQL::Schema.define do
  mutation(Binda::Api::Types::MutationType)
  query(Binda::Api::Types::QueryType)

  rescue_from ActiveRecord::RecordNotFound do
    'Record not found'
  end
end
