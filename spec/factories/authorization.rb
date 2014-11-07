FactoryGirl.define do
  factory :authorization do
    user
    nick_name 'Nick Name'
    uid '123123123'
    token '123123123'
    secret '123123123'
    profile_page 'http://pudim.com.br'
    avatar_url 'http://lorempixel.com/26/26'
  end

  trait :github do
    provider 'github'
  end
end
