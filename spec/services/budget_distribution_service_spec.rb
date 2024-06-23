# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BudgetDistributionService, type: :service do
  let(:user) { create(:user) }
  let(:budget_frequency) { 'annually' }
  let(:budgets) { create_list(:budget, 3, user:, amount: 1000, frequency: 'Monthly') }

  let(:service) { described_class.new(budgets, budget_frequency) }

  describe '#category_distribution' do
    it 'returns a hash' do
      distribution = service.category_distribution
      expect(distribution).to be_a(Hash)
    end

    it 'calculates the correct sum of distribution values' do
      distribution = service.category_distribution
      expect(distribution.values.sum).to eq(36_000)
    end
  end
end
