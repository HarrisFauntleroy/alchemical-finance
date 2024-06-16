# frozen_string_literal: true

require 'rails_helper'

describe 'Users', type: :system, js: true do
  it 'user signs up' do
    user = build(:user)
    visit root_path
    click_link 'Sign up'
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'

    expect(page).to have_current_path(root_path)
    expect(page).to have_text('Sign out')
  end

  it 'user logs in' do
    user = create(:user)
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    expect(page).to have_current_path(root_path)
    expect(page).to have_text('Sign out')
  end

  it 'user logs out' do
    user = create(:user)
    sign_in user

    expect(page).to have_current_path(root_path)
    click_button 'Sign out'

    expect(page).to have_current_path(root_path)
    expect(page).to have_text('Sign up')
    expect(page).to have_text('Sign in')
  end

  it 'user resets password' do
    # Not implemented
  end
end
