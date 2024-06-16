# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  private

  def account_params
    params.require(:account).permit
  end
end
