# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Budgets management', :js, type: :system do
  let(:user) { create(:user) }

  before do
    driven_by(:selenium_chrome)
    sign_in user
  end

  it 'allows user to create a new budget' do
    visit root_path
    click_link 'Budgets'
    click_link 'Add New Budget'
    fill_in 'Name', with: 'Test Budget'
    fill_in 'Amount', with: '1000'
    click_button 'Save Budget'

    expect(page).to have_content('Budget was successfully created.')
    expect(page).to have_content('Test Budget')
    expect(page).to have_content('1000')
  end

  it 'allows user to view a budget' do
    budget = create(:budget, name: 'Sample Budget', amount: 1500)
    visit budgets_path
    click_link budget.name
    expect(page).to have_content(budget.name)
    expect(page).to have_content('$1,500.00')
  end

  it 'allows user to update a budget' do
    budget = create(:budget, name: 'Old Budget', amount: 2000)
    visit budgets_path
    within "#budget_#{budget.id}" do
      click_link 'Edit'
    end
    fill_in 'Name', with: 'Updated Budget'
    fill_in 'Amount', with: '2500'
    click_button 'Save Budget'
    expect(page).to have_content('Budget was successfully updated.')
    expect(page).to have_content('Updated Budget')
    expect(page).to have_content('2500')
  end

  it 'allows user to delete a budget' do
    budget = create(:budget, name: 'Delete Budget', amount: 3000)
    visit budgets_path
    within "#budget_#{budget.id}" do
      accept_confirm do
        click_button 'Delete'
      end
    end
    expect(page).to have_content('Budget was successfully destroyed.')
    expect(page).not_to have_content('Delete Budget')
    expect(page).not_to have_content('3000')
  end
end
