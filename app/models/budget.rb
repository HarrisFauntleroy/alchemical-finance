# frozen_string_literal: true

class Budget < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :category, presence: true
  validates :frequency, presence: true, inclusion: { in: %w[Daily Weekly Fortnightly Monthly Quarterly Annually] }

  before_validation :normalize_frequency

  private

  def normalize_frequency
    self.frequency = frequency.capitalize if frequency.present?
  end
end
