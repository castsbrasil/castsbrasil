FactoryGirl.define do
  factory :cast do
    name "MyString"
    description "MyText"
    url FFaker::Youtube.url
    user nil
  end
end
