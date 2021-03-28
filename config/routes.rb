Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api, format: 'json' do
    resources :items, only: [:create]
  end
end