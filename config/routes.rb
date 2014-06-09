Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get '/' => 'root#index', as: :users
  root to: 'root#index'
end