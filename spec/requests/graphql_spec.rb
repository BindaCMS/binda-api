require "rails_helper"

describe "GraphQL API" do
  
  before(:context) do
		@structure = create(:article_structure_with_components_and_fields)
		@component = @structure.components.first
  end

  it "returns structures" do
    data = '{
      structures{
        edges{
          node{
            id
            name
          }
        }
      }
    }'
    post graphql_path(query: data)
    
    expect(response).to be_success
    expect(json['data']).to have_key 'structures'
    expect(json['data']['structures']['edges'].size).to eq(3)
  end

  it "returns components" do
    data = '{
      components{
        edges{
          node{
            id
            name
            slug
            string:get_string(slug: "1-field-setting"){
              value
            }
          }
        }
      }
    }'
    post graphql_path(query: data)
    expect(response).to be_success
    expect(json['data']).to have_key 'components'
    expect(json['data']['components']['edges'].size).to eq(3)
  end
end

