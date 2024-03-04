# frozen_string_literal: true

Rails.application.routes.draw do
  # https://guides.rubyonrails.org/routing.html

  get 'up' => 'rails/health#show', as: :rails_health_check
  # root "posts#index"
end
