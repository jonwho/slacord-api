FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password '12341234'
    password_confirmation '12341234'
  end
end
