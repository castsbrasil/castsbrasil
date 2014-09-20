Rails.application.routes.draw do
  resources :casts
  resource :profiles, only: [:update]
  resources :categories
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }, skip: :registrations
  devise_scope :user do
    resource :registration,
             only: [:new, :create, :edit, :update],
             path: 'users',
             path_names: { new: 'sign_up' },
             controller: 'devise/registrations',
             as: :user_registration
  end

  get '/' => 'root#index', as: :users
  root to: 'root#index'
end
