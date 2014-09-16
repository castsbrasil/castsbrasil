FactoryGirl.define do
  factory :level do
    sequence(:name, (1..10).cycle) { |n| "Nível #{n}" }
    sequence(:required_score, (1..10).cycle) { |n| (n - 1)*100 }
  end
end
