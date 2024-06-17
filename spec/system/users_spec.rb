# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', :js, type: :system do
  def fill_sign_up_form(user)
    visit root_path
    click_link 'Sign up'
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
  end

  def fill_sign_in_form(user)
    visit root_path
    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  describe 'Sign up' do
    let(:user) { build(:user) }

    it 'redirects to root path after signing up' do
      fill_sign_up_form(user)
      expect(page).to have_current_path(root_path)
    end

    it 'displays sign out text after signing up' do
      fill_sign_up_form(user)
      expect(page).to have_text('Sign out')
    end
  end

  describe 'Sign in' do
    let(:user) { create(:user) }

    it 'redirects to root path after logging in' do
      fill_sign_in_form(user)
      expect(page).to have_current_path(root_path)
    end

    it 'displays sign out text after logging in' do
      fill_sign_in_form(user)
      expect(page).to have_text('Sign out')
    end
  end

  describe 'Sign out' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'redirects to root path after signing out' do
      click_button 'Sign out'
      expect(page).to have_current_path(root_path)
    end

    it 'displays sign up text after signing out' do
      click_button 'Sign out'
      expect(page).to have_text('Sign up')
    end

    it 'displays sign in text after signing out' do
      click_button 'Sign out'
      expect(page).to have_text('Sign in')
    end
  end
end
