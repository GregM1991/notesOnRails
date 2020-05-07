Rails.application.routes.draw do
  resources :notes
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to:"notes#index" 
  root to:"notes#index" #had to define this so that the success/fail payment knows where to go
  get "/payments/success", to:"payments#success"

  post "/payments/webhook", to: "payments#webhook"
end
