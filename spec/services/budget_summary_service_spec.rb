# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BudgetSummaryService, type: :service do
  let(:user) { create(:user) }
  let(:budget_frequency) { 'annually' }
  let(:service) { described_class.new(user, budget_frequency) }

  before do
    create_list(:budget, 3, user:, amount: 1000, frequency: 'Monthly')
  end

  describe '#initialize' do
    it 'calculates the total amount correctly' do
      expect(service.total_amount).to eq(36_000)
    end

    it 'calculates the income correctly' do
      expect(service.income).to eq(60_000)
    end

    it 'calculates the remaining amount correctly' do
      expect(service.remaining_amount).to eq(24_000)
    end

    it 'generates the correct category distribution' do
      expect(service.category_distribution).to be_a(Hash)
    end
  end
end
