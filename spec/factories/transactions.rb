# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    account { nil }
    amount { '9.99' }
    timestamp { '2024-06-16 16:04:05' }
  end
end
