FactoryBot.define do
  factory :administrator, class: 'Administrator' do
    email { "MyString" }
    crypted_password { "MyString" }
    salt { "MyString" }
  end
end
