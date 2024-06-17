# frozen_string_literal: true

# Controller for managing accounts...
# Accounts can be any asset or liability including but not limited to:
# Credit cards, Loans, Mortgages, Savings accounts, Buy now pay later, Bank accounts, ETFs, Investments, Cryptocurrency, Retirement accounts, Real estate, Superannuation
class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  private

  def account_params
    params.require(:account).permit
  end
end
