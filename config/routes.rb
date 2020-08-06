
Rails.application.routes.draw do



  resources :potins do
    resources :comments 
  end

  resources :potins

  resources :user

  resources :welcome

  resources :cities

  resources :sessions, only: [:new, :create, :destroy]





  get '/team', to: 'team#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get'/contact', to: 'contact#show'
  

  root 'home#show'  
end

