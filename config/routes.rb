Rails.application.routes.draw do
  resources :categories
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations",
    passwords:          "users/passwords",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_for :editors, path: 'editors', controllers: {
    registrations:      "editors/registrations",
  }
  resources :users, only: [:show]
  resources :photos
  resources :softwares do 
    resources :likes, only: [:create, :destroy], shallow: true
  end
  resources :comments, only: [:create, :new]
  resources :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'softwares#index'

  get '/myapp' => 'pages#myapp'
  get '/mentions' => 'pages#mentions'
end