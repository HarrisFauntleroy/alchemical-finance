# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BudgetCalculationService, type: :service do
  let(:budget) { create(:budget, amount: 1000, frequency: 'Monthly') }
  let(:service) { described_class.new(budget) }

  describe '#amount_for_budget_frequency' do
    it 'calculates the correct amount for daily budget_frequency' do
      expect(service.amount_for_budget_frequency('daily')).to eq(33.33) # 1000 / 30
    end

    it 'calculates the correct amount for monthly budget_frequency' do
      expect(service.amount_for_budget_frequency('monthly')).to eq(1000)
    end

    it 'returns 0 for unknown budget_frequency' do
      expect(service.amount_for_budget_frequency('unknown')).to eq(0)
    end
  end
end
