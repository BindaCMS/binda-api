require "rails_helper"

describe "GraphQL API" do
  
  before(:context) do
		@structure = create(:article_structure_with_components_and_fields)
    @structure.components.each do |component|
      component.strings.each{|string| string.update(content: "Content of string #{string.field_setting.slug}") }
    end
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

  it "returns a board by its slug" do
    data = '{
      board_by_slug(slug: "dashboard"){
        name
      }
    }'
    post graphql_path(query: data)
    expect(response).to be_success
    expect(json['data']).to have_key 'board_by_slug'
    expect(json['data']['board_by_slug']['name']).to eq 'dashboard'
  end
  
  it "returns a dynamic string field" do
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
    json['data']['components']['edges'].each do |component|
      expect(component['node']['string']['value']).to eq "Content of string 1-field-setting"
    end
  end

  it "returns repeater's dynamic fields" do
    component = Binda::Component.last
    repeater = component.repeaters.first
    string = repeater.strings.first
    string.update content: "Content of repeater string"
    data = '{
      components{
        edges{
          node{
            id
            slug
            repeaters(slug: "'+repeater.field_setting.slug+'"){
              string:get_string(slug: "'+string.field_setting.slug+'"){
                value
              }
            }
          }
        }
      }
    }'
    post graphql_path(query: data)
    component = json['data']['components']['edges'].first['node']
    expect(component['repeaters'].count).to eq 1
    expect(component['repeaters'].first['string']['value']).to eq "Content of repeater string"
  end

  it "returns blank for a dynamic string field that doesn't exist" do
    data = '{
      components{
        edges{
          node{
            id
            name
            slug
            string:get_string(slug: "missing-field-setting"){
              value
            }
          }
        }
      }
    }'
    post graphql_path(query: data)
    json['data']['components']['edges'].each do |component|
      expect(component['node']['string']['value']).to eq ""
    end
  end

end

