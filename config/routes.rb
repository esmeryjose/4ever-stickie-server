Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:update]
      resources :notes, only: [:create,:update]
      resources :boards, only: [:index,:create,:show,:update]
      post "signup", to: "users#create"
      post "login", to: "sessions#create"
      get "sessions/current_user", to: "sessions#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
