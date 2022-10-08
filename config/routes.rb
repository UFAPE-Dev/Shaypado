Rails.application.routes.draw do
  resources :instrutors
  resources :academia
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  devise_for :proprietarios, :controllers => {:registrations => "registrations"}

end
