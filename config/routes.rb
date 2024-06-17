# frozen_string_literal: true

# https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :profiles,
             controllers: {
               sessions: 'profiles/sessions',
               registrations: 'profiles/registrations',
               passwords: 'profiles/passwords'
             }

  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'news', to: 'newsfeeds#index'
  resources :profiles, only: %i[show] do
    resources :statuses, only: %i[create destroy]
  end

  resources :notifications, only: %i[index]

  root 'newsfeeds#index'
end
