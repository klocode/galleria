Rails.application.routes.draw do

  resources :password_resets
  resources :users

  resources :galleries do
    member do
      get "shares" => 'galleries#shares'
      post "shares" => 'galleries#send_to'
    end
    resources :posts do
      resources :shares, only:[:new, :create]
    end
  end


  root 'galleries#index'
  get "/signin" => 'sessions#new', as: :signin
  post "/signin" => 'sessions#create'
  delete "/signout" => 'sessions#destroy', as: :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
