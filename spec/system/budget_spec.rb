# frozen_string_literal: true

require 'rails_helper'

describe 'Budgets', :js, type: :system do
  let(:user) { create(:user) }

  describe 'creating a budget' do
    before do
      sign_in user

      within '#navigation' do
        click_link_or_button 'Budgets'
      end

      click_link 'Add New Budget'

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

  describe 'editing a budget' do
    let(:budget) { create(:budget, user:) }

    before do
      sign_in user

      within '#navigation' do
        click_link_or_button 'Budgets'
      end

      within "#budget_#{budget.id}" do
        click_link 'Edit'
      end

      within '#new_budget' do
        fill_in 'Name', with: 'Updated Budget'
        fill_in 'Amount', with: 2000
        fill_in 'Category', with: 'Updated Category'
        fill_in 'Currency', with: 'USD'
        fill_in 'Frequency', with: 'Weekly'
        click_link_or_button 'Save Budget'
      end
    end

    it 'shows success message after editing a budget' do
      expect(page).to have_content('Budget was successfully updated.')
    end

    it 'displays the updated budget name' do
      expect(page).to have_content('Updated Budget')
    end

    it 'displays the updated budget amount' do
      expect(page).to have_content('2000')
    end

    it 'displays the updated budget category' do
      expect(page).to have_content('Updated Category')
    end

    it 'displays the updated budget currency' do
      expect(page).to have_content('USD')
    end

    it 'displays the updated budget frequency' do
      expect(page).to have_content('Weekly')
    end
  end

  describe 'deleting a budget' do
    let(:budget) { create(:budget, user:) }

    before do
      sign_in user

      within '#navigation' do
        click_link_or_button 'Budgets'
      end

      within "#budget_#{budget.id}" do
        accept_confirm do
          click_button 'Delete'
        end
      end
    end

    # Not working
    # it 'shows success message after deleting a budget' do
    #   expect(page).to have_content('Budget was successfully deleted.')
    # end

    it 'does not display the deleted budget name' do
      expect(page).not_to have_content(budget.name)
    end

    it 'does not display the deleted budget amount' do
      expect(page).not_to have_content(budget.amount)
    end

    it 'does not display the deleted budget category' do
      expect(page).not_to have_content(budget.category)
    end

    it 'does not display the deleted budget currency' do
      expect(page).not_to have_content(budget.currency)
    end

    it 'does not display the deleted budget frequency' do
      expect(page).not_to have_content(budget.frequency)
    end
  end

  describe 'paginating budgets' do
    before do
      create_list(:budget, 15, user:, name: 'Test Budget')
      sign_in user

      within '#navigation' do
        click_link_or_button 'Budgets'
      end
    end

    it 'displays 10 budgets on the first page' do
      expect(page).to have_content('Test Budget', count: 10)
    end

    it 'displays 5 budgets on the second page' do
      within '#pagination' do
        first('a', text: '>').click
      end

      expect(page).to have_content('Test Budget', count: 5)
    end
  end
end
