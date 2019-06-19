Rails.application.routes.draw do
  root 'pages#home'
  resources :addresses, only: [:new, :create, :index]
end