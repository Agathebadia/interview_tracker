Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: [:show]
  root to: 'pages#home'
end
