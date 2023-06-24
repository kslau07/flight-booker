Rails.application.routes.draw do
  root 'flights#index'

  resources :flights, only: %i[index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
