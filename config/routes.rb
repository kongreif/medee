Rails.application.routes.draw do
  # public profiles visible to other users
  devise_for :users

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :midis, only: %i[index show create new edit update destroy]
  resources :profiles, only: %i[edit update show]

  # get "midis", to: "midis#index", as: :midis
  # get "midi/:id", to: "midis#show", as: :midi
end
