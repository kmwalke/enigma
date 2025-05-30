Rails.application.routes.draw do
  resources :ceasers
  root to: 'home#index'
end
