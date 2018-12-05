FactoryBot.define do
  sequence(:category_name) { |n| "Test Category ##{n}" }

  factory :category, class: Binda::Category do
    name { generate :category_name }
    association :structure
  end
end
