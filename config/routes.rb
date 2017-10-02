Rails.application.routes.draw do
  resources :people
  root to: "static#home"
  post "/", to: "static#update"
end
