# frozen_string_literal: true

FactoryBot.define do
  factory :budget do
    name { 'MyString' }
    amount { '9.99' }
    start_date { '2024-06-16' }
    end_date { '2024-06-16' }
  end
end
