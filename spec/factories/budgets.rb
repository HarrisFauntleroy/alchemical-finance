# frozen_string_literal: true

FactoryBot.define do
  factory :budget do
    name { 'Test Budget' }

    user

    amount { '9.99' }
    category { 'Test Category' }
    currency { 'BTC' }
    frequency { 'Monthly' }

    start_date { '2024-06-16' }
    end_date { '2024-06-16' }
  end
end
