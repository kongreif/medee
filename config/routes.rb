Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :midis, only: %i[index show create]
  resources :profiles, only: %i[update edit]

  # get "midis", to: "midis#index", as: :midis
  # get "midi/:id", to: "midis#show", as: :midi

  # profiles routes
  # TODO: profile/:id
  get 'profile', to: 'profiles#profile', as: 'profile'
  # get 'profiles/edit_profile_photo', to: 'profiles#edit_profile_photo', as: 'edit_profile_photo'
end
