# frozen_string_literal: true

Rails.application.routes.draw do
  # https://guides.rubyonrails.org/routing.html

  get 'news', to: 'newsfeeds#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :profiles, only: %i[show]

  # root "posts#index"
end
