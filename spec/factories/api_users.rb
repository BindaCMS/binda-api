FactoryBot.define do
  factory :api_user, class: Binda::ApiUser do
    sequence(:name){ |n| "Api User #{n}" }
  end
end
