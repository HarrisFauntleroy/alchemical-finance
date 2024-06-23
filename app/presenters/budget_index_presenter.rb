# frozen_string_literal: true

class BudgetIndexPresenter
  attr_reader :total_amount, :remaining_amount, :category_distribution, :income, :budgets, :pagy

  def initialize(user, budget_frequency, budgets, pagy)
    @user = user
    @budget_frequency = budget_frequency
    @budgets = budgets
    @pagy = pagy
    calculate_summary
  end

  def budget
    Budget.new
  end

  private

  def calculate_summary
    summary_service = BudgetSummaryService.new(@user, @budget_frequency)
    @category_distribution = summary_service.category_distribution
    @total_amount = summary_service.total_amount
    @remaining_amount = summary_service.remaining_amount
    @income = summary_service.income
  end
end
