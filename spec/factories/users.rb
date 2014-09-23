FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'password'
    profile
  end
end
