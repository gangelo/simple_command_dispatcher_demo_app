FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    first_name { "Test" }
    last_name { "User" }
    password { "password" }
    password_confirmation { "password" }
    role { User::ROLE_USER }
    created_at { Time.current }
    updated_at { Time.current }
  end

  trait :admin_role do
    role { User::ROLE_ADMIN }
  end

  trait :user_role do
    role { User::ROLE_USER }
  end
end
