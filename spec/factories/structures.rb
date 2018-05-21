FactoryBot.define do

  sequence(:article_structure_title) { |n| "N.#{n} Article" }
  sequence(:structure_name) { |n| "##{n} structure" }

  # Structure
  factory :structure, class: Binda::Structure do 
    name { generate :structure_name }
		slug { "#{name}".parameterize }
    instance_type 'component'
	end

  # Boards are automatically generated when you create 
  # a structure with `instance_type` = `board`
  factory :board_structure, class: Binda::Structure do
    sequence(:name) { |n| "##{n} board" }
    slug { "#{name}".parameterize }
    instance_type 'board'
  end

	# Article structure
  factory :article_structure, parent: :structure do
  	name { generate :article_structure_title }
	end

  # Article structure with components
	# @see https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
  factory :article_structure_with_components, parent: :structure do
    transient do
      components_count 3
    end
    after(:create) do |structure, evaluator|
      create_list( :article_component, evaluator.components_count, structure: structure)
    end
  end

  # Article structure with components
  # @see https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
  factory :article_structure_with_components_and_fields, parent: :structure do
    transient do
      components_count 3
    end
    after(:create) do |structure, evaluator|
      # get default field group which is generated by default for each structure
      default_field_group = structure.field_groups.first
      # Generate some field settings
      create :string_setting, field_group: default_field_group
      create :text_setting, field_group: default_field_group
      create :repeater_setting_with_children_settings, field_group: default_field_group
      create :radio_setting_with_choices, field_group: default_field_group
      create :selection_setting_with_choices, field_group: default_field_group
      create :checkbox_setting_with_choices, field_group: default_field_group
      create_list( :article_component, evaluator.components_count, structure: structure)
    end
  end

end
