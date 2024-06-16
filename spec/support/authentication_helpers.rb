# frozen_string_literal: true

module AuthenticationHelpers
  def sign_up(user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
  end

  def sign_in(user)
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  def sign_out
    find('#user-profile').click
    click_button 'Sign out'
  end
end
