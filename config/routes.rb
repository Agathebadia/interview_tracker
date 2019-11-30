Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :job_applications do
    resources :interviews, only: [:new, :create, :edit, :update]

    patch :toggle_favorite, controller: :favorites
  end

  resources :profiles, only: [:show]


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlr
end
