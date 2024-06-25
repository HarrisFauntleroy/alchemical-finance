# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  # Need to add the admin model
  # authenticate :admin do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  devise_for :users

  root 'pages#index'

  resources :budgets
  resources :accounts
  resources :transactions
end
