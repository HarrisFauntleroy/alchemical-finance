# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Budget, type: :model do
  subject(:budget) do
    described_class.new(name: 'Test Budget', amount: 1000, category: 'Test Category', frequency: 'Monthly', user:)
  end

  let(:user) { create(:user) }

  describe 'factory' do
    it 'is valid' do
      expect(budget).to be_valid
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      budget = build(:budget, name: 'Test Budget', amount: 1000, category: 'Test Category', frequency: 'Monthly')
      expect(budget).to be_valid
    end

    it 'is invalid without a name' do
      budget = build(:budget, name: nil)
      expect(budget).not_to be_valid
    end

    it 'provides the correct error message when name is missing' do
      budget = build(:budget, name: nil)
      budget.valid?  # Validate the object to generate errors
      expect(budget.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an amount' do
      budget = build(:budget, amount: nil)
      expect(budget).not_to be_valid
    end

    it 'provides the correct error message when amount is missing' do
      budget = build(:budget, amount: nil)
      budget.valid?  # Validate the object to generate errors
      expect(budget.errors[:amount]).to include("can't be blank")
    end

    it 'is invalid with a negative amount' do
      budget = build(:budget, amount: -1)
      expect(budget).not_to be_valid
    end

    it 'provides the correct error message for a negative amount' do
      budget = build(:budget, amount: -1)
      budget.valid?  # Validate the object to generate errors
      expect(budget.errors[:amount]).to include('must be greater than or equal to 0')
    end

    it 'is invalid without a category' do
      budget = build(:budget, category: nil)
      expect(budget).not_to be_valid
    end

    it 'provides the correct error message when category is missing' do
      budget = build(:budget, category: nil)
      budget.valid?  # Validate the object to generate errors
      expect(budget.errors[:category]).to include("can't be blank")
    end

    it 'validates inclusion of frequency in an expected array' do
      expect(budget).to validate_inclusion_of(:frequency).in_array(%w[Daily Weekly Fortnightly Monthly Quarterly])
    end

    it 'is invalid without a frequency' do
      budget = build(:budget, frequency: nil)
      expect(budget).not_to be_valid
    end

    it 'provides the correct error message when frequency is missing' do
      budget = build(:budget, frequency: nil)
      budget.valid?  # Validate the object to generate errors
      expect(budget.errors[:frequency]).to include("can't be blank")
    end

    it 'is invalid with an unsupported frequency' do
      budget = build(:budget, frequency: 'Yearly')
      expect(budget).not_to be_valid
    end

    it 'provides the correct error message for an unsupported frequency' do
      budget = build(:budget, frequency: 'Yearly')
      budget.valid?  # Validate the object to generate errors
      expect(budget.errors[:frequency]).to include('is not included in the list')
    end
  end

  describe 'associations' do
    let(:user) { create(:user) }

    before do
      create(:budget, user:)
    end

    it 'automatically deletes all associated budgets when the user is deleted' do
      expect { user.destroy }.to change(described_class, :count).by(-1)
    end
  end

  describe 'callbacks' do
    it 'capitalizes the frequency before validation' do
      budget = build(:budget, frequency: 'monthly')
      budget.validate
      expect(budget.frequency).to eq('Monthly')
    end
  end

  describe 'CRUD methods' do
    it 'can be created' do
      new_budget = build(:budget, name: 'New Budget', amount: 500, category: 'New Category', frequency: 'Weekly',
                                  user:)
      new_budget.save
      expect(new_budget).to be_persisted
    end

    it 'can be read' do
      created_budget = create(:budget, name: 'Read Budget', user:)
      expect(described_class.find(created_budget.id)).to eq(created_budget)
    end

    it 'can be updated' do
      budget_to_update = create(:budget, name: 'Old Budget', user:)
      budget_to_update.update(name: 'Updated Budget')
      expect(budget_to_update.reload.name).to eq('Updated Budget')
    end

    it 'can be deleted' do
      budget_to_delete = create(:budget, user:)
      budget_id = budget_to_delete.id
      budget_to_delete.destroy
      expect(described_class.where(id: budget_id)).to be_empty
    end
  end
end
