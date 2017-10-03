Rails.application.routes.draw do
  devise_for :users
  resources :people
  root to: "static#home"
  post "/", to: "static#update"
end
