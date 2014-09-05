# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    firstname "MyString"
    lastname "MyString"
    user nil
  end
end
