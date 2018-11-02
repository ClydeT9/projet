Rails.application.routes.draw do
  resources :photos
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations",
  }
  devise_for :editors, path: 'editors', controllers: {
    sessions:           "editors/sessions",
    passwords:          "editors/passwords",
    registrations:      "editors/registrations",
    confirmations:      "editors/confirmations",
  }
  resources :softwares
  resources :photos
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'softwares#index'

  get '/myapp' => 'pages#myapp'
end
