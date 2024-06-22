# frozen_string_literal: true

class BudgetIndexPresenter
  attr_reader :total_amount, :remaining_amount, :category_distribution, :income, :budgets, :pagy

  def initialize(user, view, budgets, pagy)
    @user = user
    @view = view
    @budgets = budgets
    @pagy = pagy
    calculate_summary
  end

  def budget
    Budget.new
  end

  private

  def calculate_summary
    summary_service = BudgetSummaryService.new(@user, @view)
    @category_distribution = summary_service.category_distribution
    @total_amount = summary_service.total_amount
    @remaining_amount = summary_service.remaining_amount
    @income = summary_service.income
  end
end
