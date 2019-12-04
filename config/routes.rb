Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :job_applications do
    resources :interviews, only: [:new, :create, :edit, :update]

    patch :toggle_favorite, controller:   :favorites
  end

  resources :profiles, only: [:create, :edit, :update]
    get '/profiles', to: 'profiles#show', as: :show_profiles
    get '/profiles', to: 'profiles#new', as: :new_profile

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlr
end
