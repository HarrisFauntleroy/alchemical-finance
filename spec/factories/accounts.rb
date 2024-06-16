# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { 'MyString' }
    balance { '9.99' }
    currency { 'MyString' }
  end
end
