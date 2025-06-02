Rails.application.routes.draw do
  root to: 'home#index'

  resources :ceasers
  post 'ceasers/:id/encode', to: 'ceasers#encode', as: 'encode_ceaser'
end
