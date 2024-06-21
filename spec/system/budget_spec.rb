# frozen_string_literal: true

require 'rails_helper'

describe 'Budgets', :js, type: :system do
  # before do
  #   driven_by(:selenium_chrome)
  # end

  describe 'creating a budget' do
    let(:user) { create(:user) }

    before do
      sign_in user

      within '#navigation' do
        click_link_or_button 'Budgets'
      end

      click_link_or_button 'Add New Budget'

      within '#new_budget' do
        fill_in 'Name', with: 'Test Budget'
        fill_in 'Amount', with: 1000
        fill_in 'Category', with: 'Test Category'
        fill_in 'Currency', with: 'USD'
        fill_in 'Frequency', with: 'Monthly'
        click_link_or_button 'Save Budget'
      end
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

    it 'displays the new budget category' do
      expect(page).to have_content('Test Category')
    end

    it 'displays the new budget currency' do
      expect(page).to have_content('USD')
    end

    it 'displays the new budget frequency' do
      expect(page).to have_content('Monthly')
    end
  end

  describe 'viewing a budget' do
    let(:user) { create(:user) }
    let(:budget) { create(:budget, user:) }

    before do
      sign_in user

      within '#navigation' do
        click_link_or_button 'Budgets'
      end

      within "#budget_#{budget.id}" do
        click_link budget.name
      end
    end

    it 'displays the budget name' do
      expect(page).to have_content(budget.name)
    end

    it 'displays the budget amount' do
      expect(page).to have_content(budget.amount)
    end

    it 'displays the budget category' do
      expect(page).to have_content(budget.category)
    end

    it 'displays the budget currency' do
      expect(page).to have_content(budget.currency)
    end

    it 'displays the budget frequency' do
      expect(page).to have_content(budget.frequency)
    end
  end
end
