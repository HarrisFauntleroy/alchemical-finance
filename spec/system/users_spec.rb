# frozen_string_literal: true

require 'rails_helper'

describe 'Users', :js, type: :system do
  describe 'Sign up' do
    let(:user) { build(:user) }

    it 'redirects to root path after signing up' do
      sign_up(user)
      expect(page).to have_current_path(root_path)
    end

    it 'displays sign out text after signing up' do
      sign_up(user)
      expect(page).to have_text('Sign out')
    end
  end

  describe 'Sign in' do
    let(:user) { create(:user) }

    it 'redirects to root path after logging in' do
      sign_in user
      expect(page).to have_current_path(root_path)
    end

    it 'displays welcome text after logging in' do
      sign_in user
      expect(page).to have_text("Welcome #{user.email}!")
    end

    it 'displays sign out text after logging in' do
      sign_in user
      expect(page).to have_text('Sign out')
    end
  end

  describe 'Sign out' do
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it 'redirects to root path after signing out' do
      click_on 'Sign out'
      expect(page).to have_current_path(root_path)
    end

    it 'displays sign up text after signing out' do
      click_on 'Sign out'
      expect(page).to have_text('Sign up')
    end

    it 'displays sign in text after signing out' do
      click_on 'Sign out'
      expect(page).to have_text('Sign in')
    end
  end
end
