Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :links, only: [:create, :show]

  get "/:token" => "links#show"

  get "/:token/info" => "links#info"


end
