# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    name "name"
    url "http://www.test.com"
    profile nil
  end
end
