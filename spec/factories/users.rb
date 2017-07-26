FactoryGirl.define do
  factory :user do
    username { FFaker::Name.name }
    email { FFaker::Internet.email }
    password '12341234'
    password_confirmation '12341234'
  end
end
