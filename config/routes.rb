Rails.application.routes.draw do

  resources :users

  resources :galleries do
    resources :posts
  end


  root 'galleries#index'
  get "/login" => 'sessions#new', as: :login
  post "/login" => 'sessions#create'
  delete "/logout" => 'sessions#destroy', as: :logout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
