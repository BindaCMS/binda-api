FactoryBot.define do
  factory :api_user, class: Binda::Api::User do
    sequence(:name){ |n| "Api User #{n}" }
  end
end
