# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @accounts = Account.all
  end

  private

  def transaction_params
    params.require(:transaction).permit
  end
end
