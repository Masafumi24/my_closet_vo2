Rails.application.routes.draw do
  root to: 'closet#index'

  namespace :api, format: 'json' do
    resources :items, only: [:create]
    resources :colors, only: [:index]
  end
end