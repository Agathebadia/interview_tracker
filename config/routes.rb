Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :job_applications #leads to create page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
