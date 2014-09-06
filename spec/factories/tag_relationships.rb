# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag_relationship do
    taggable nil
    tag nil
  end
end
