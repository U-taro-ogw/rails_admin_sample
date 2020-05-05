FactoryBot.define do
  factory :administrator, class: 'Administrator' do
    email { 'example@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    role { 0 }

    trait :role_A do
      role { 0 }
    end

    trait :role_B do
      role { 1 }
    end

    trait :role_C do
      role { 2 }
    end
  end
end
