# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'

  resources :budgets
  resources :accounts
  resources :transactions
end
