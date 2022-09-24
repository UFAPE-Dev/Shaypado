Rails.application.routes.draw do
  resources :academia
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  devise_for :users

end
