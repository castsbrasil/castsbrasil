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
  get '/colabore', to: redirect('https://github.com/RubyCastsBrasil/RubyCastsBrasil/wiki/Contribuindo'), as: :contributing
  get '/sobre', to: redirect('https://github.com/RubyCastsBrasil/RubyCastsBrasil/wiki'), as: :about
  scope '/screencasts' do
    get '/' => 'home#screencasts', as: :screencasts
    get '/:id' => 'home#screencast', as: :screencast
  end
  root to: 'home#index'
end
