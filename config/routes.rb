Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resource :midis, only: %i[index show]

  get "midis", to: "midis#index", as: :midis
  get "midi/:id", to: "midis#show", as: :midi
end
