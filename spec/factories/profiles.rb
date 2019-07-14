# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name 'John'
    last_name 'Doe'
    user nil
  end
end
