Rails.application.routes.draw do
  root to: 'closet#index'

  namespace :api, format: 'json' do
    resources :items, only: [:create]
  end
end