Rails.application.routes.draw do
  get 'likes/index'
  get 'posts/index'
  get 'posts/show'
  get '/search', to: "posts#search"
  devise_for :users

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root "articles#index"
  resources :users
  resources :articles do
    collection do
      post :import 
    resources :posts do
      resources :comments
      resources :likes
    end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
