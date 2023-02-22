Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  devise_for :users

  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  root "articles#index"
  resources :users
  resources :articles do 
    resources :posts do
      resources :comments
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
