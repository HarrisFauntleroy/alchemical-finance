# frozen_string_literal: true

module AuthenticationHelpers
  def sign_up(user)
    navigate_to_sign_up
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
      fill_in 'user_password_confirmation', with: user.password
      click_on 'Sign up'
    end
  end

  def sign_in(user)
    navigate_to_sign_in
    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_on 'Sign in'
    end
  end

  def sign_out
    visit root_path
    find('#user-profile').click
    click_on 'Sign out'
  end

  private

  def navigate_to_sign_up
    navigate_to_sign_in
    click_on 'Sign up'
  end

  def navigate_to_sign_in
    visit root_path
    within('#navigation') { click_on 'Sign in' }
  end
end
