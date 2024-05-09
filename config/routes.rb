# frozen_string_literal: true

# https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :profiles,
             controllers: {
               sessions: 'profiles/sessions',
               registrations: 'profiles/registrations',
               passwords: 'profiles/passwords'
             }

  get 'news', to: 'newsfeeds#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :profiles, only: %i[show]

  root 'newsfeeds#index'
end
