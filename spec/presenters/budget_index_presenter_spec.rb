# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BudgetIndexPresenter, type: :presenter do
  let(:user) { create(:user) }
  let(:budget_frequency) { 'annually' }
  let(:budgets) { Budget.all }
  let(:pagy) { Pagy.new(count: budgets.count, page: 1) }
  let(:presenter) { described_class.new(user, budget_frequency, budgets, pagy) }

  before do
    create_list(:budget, 3, user:, amount: 1000, frequency: 'Monthly')
  end

  describe '#initialize' do
    it 'assigns the correct total amount' do
      expect(presenter.total_amount).to eq(36_000)
    end

    it 'assigns the correct income' do
      expect(presenter.income).to eq(60_000)
    end

    it 'assigns the correct remaining amount' do
      expect(presenter.remaining_amount).to eq(24_000)
    end

    it 'assigns the correct category distribution' do
      expect(presenter.category_distribution).to be_a(Hash)
    end
  end

  describe '#budget' do
    it 'returns a new Budget instance' do
      expect(presenter.budget).to be_a_new(Budget)
    end
  end
end
