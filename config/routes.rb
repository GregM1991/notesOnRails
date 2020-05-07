Rails.application.routes.draw do
  resources :notes
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to:"notes#index"

end
