# frozen_string_literal: true

class Budget < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :currency, presence: true
  validates :frequency, presence: true
end
