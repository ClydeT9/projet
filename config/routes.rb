Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  scope 'lola' do
    ActiveAdmin.routes(self)
    get '/', to: 'admin/dashboard#index'
  end

  get :search, controller: :pages
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  
  resources :categories
  devise_for :users, path: 'users', controllers: {
    sessions:           "users/sessions",
    passwords:          "users/passwords",
    registrations:      "users/registrations",
    confirmations:      "users/confirmations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_for :editors, path: 'editors', controllers: {
    registrations:      "editors/registrations",
  }
  resources :users, only: [:show]
  resources :softwares, path: 'app' do 
    member do
      delete :delete_image_attachment
      put "like" => "softwares#upvote"
     end  
  end
  resources :likes, only: [:create, :destroy, :index], shallow: true
  resources :comments, only: [:create, :new]
  resources :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'softwares#index'
  get '/myapp' => 'pages#myapp'
  get '/mentions' => 'pages#mentions'
end