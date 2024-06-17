# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Budgets management', :js, type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:selenium_chrome)
    sign_in user
  end

  def create_budget(name, amount)
    visit budgets_path
    click_link 'Add New Budget'
    fill_in 'Name', with: name
    fill_in 'Amount', with: amount
    click_button 'Save Budget'
  end

  describe 'creating a budget' do
    before do
      create_budget('Test Budget', '1000')
    end

    it 'shows success message after creating a new budget' do
      expect(page).to have_content('Budget was successfully created.')
    end

    it 'displays the new budget name' do
      expect(page).to have_content('Test Budget')
    end

    it 'displays the new budget amount' do
      expect(page).to have_content('1000')
    end
  end

  describe 'viewing a budget' do
    let!(:budget) { create(:budget, name: 'Sample Budget', amount: 1500) }

    before do
      visit budgets_path
      click_link budget.name
    end

    it 'displays the budget name' do
      expect(page).to have_content(budget.name)
    end

    it 'displays the budget amount' do
      expect(page).to have_content('$1,500.00')
    end
  end

  describe 'updating a budget' do
    let!(:budget) { create(:budget, name: 'Old Budget', amount: 2000) }

    before do
      visit budgets_path
      within "#budget_#{budget.id}" do
        click_link 'Edit'
      end
      fill_in 'Name', with: 'Updated Budget'
      fill_in 'Amount', with: '2500'
      click_button 'Save Budget'
    end

    it 'shows success message after updating a budget' do
      expect(page).to have_content('Budget was successfully updated.')
    end

    it 'displays the updated budget name' do
      expect(page).to have_content('Updated Budget')
    end

    it 'displays the updated budget amount' do
      expect(page).to have_content('2500')
    end
  end

  describe 'deleting a budget' do
    let!(:budget) { create(:budget, name: 'Delete Budget', amount: 3000) }

    before do
      visit budgets_path
      within "#budget_#{budget.id}" do
        accept_confirm do
          click_button 'Delete'
        end
      end
    end

    it 'shows success message after deleting a budget' do
      expect(page).to have_content('Budget was successfully destroyed.')
    end

    it 'no longer displays the deleted budget name' do
      expect(page).not_to have_content('Delete Budget')
    end

    it 'no longer displays the deleted budget amount' do
      expect(page).not_to have_content('3000')
    end
  end
end
