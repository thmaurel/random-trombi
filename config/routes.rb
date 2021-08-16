Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profiles, only: [:new, :create, :show, :index]
  resources :games, only: [:create, :show] do
    member do
      get :random
      post :submit
    end
  end
  get 'random', to: "profiles#random"
  post 'submit', to: "profiles#submit"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
