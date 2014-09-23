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
  get '/' => 'home#index', as: :users  # TODO: lol users_url ? Oo
  get '/colabore' => 'home#contributing', as: :contributing
  get '/sobre' => 'home#about', as: :about
  get '/screencasts' => 'home#screencasts', as: :screencasts
  root to: 'home#index'
end