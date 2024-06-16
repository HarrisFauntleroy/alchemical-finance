# frozen_string_literal: true

class UsersController < ApplicationController
  include Pundit::Authorization

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
