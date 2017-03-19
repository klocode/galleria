Rails.application.routes.draw do

  resources :password_resets
  resources :users

  resources :galleries do
    resources :posts
  end


  root 'galleries#index'
  get "/signin" => 'sessions#new', as: :signin
  post "/signin" => 'sessions#create'
  delete "/signout" => 'sessions#destroy', as: :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
