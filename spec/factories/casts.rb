# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cast do
    name "MyString"
    description "MyText"
    url "MyString"
    user nil
  end
end
