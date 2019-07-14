# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email 'test@test.com'
    password 'password'
    profile
  end
end
