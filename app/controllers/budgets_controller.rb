# frozen_string_literal: true

class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  private

  def budget_params
    params.require(:budget).permit
  end
end
