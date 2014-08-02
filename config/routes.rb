Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, skip: :registrations
  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             path_names: { new: 'sign_up' },
             controller: 'devise/registrations',
             as: :user_registration
  end

  namespace :users do
    namespace :auth do
      resource :confirm, only: :create, controller: :confirm
    end
  end

  get '/' => 'root#index', as: :users
  root to: 'root#index'
end