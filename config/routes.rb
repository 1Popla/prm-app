Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'

 end

  resources :contacts
  resources :consultations
  #get 'home/index'
  #root 'home#index'
  root 'contacts#index'
  get 'home/about'
  get 'search', to:"contacts#search"
  get 'pages/home'
  get 'pages/consultation'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
  