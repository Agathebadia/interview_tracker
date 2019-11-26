Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :job_applications, only: [:edit, :update, :create, :new, :show]
  resources :profiles, only: [:show]
end
