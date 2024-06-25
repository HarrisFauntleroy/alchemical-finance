# frozen_string_literal: true

# Service to calculate budget summary for a user
class BudgetSummaryService
  attr_reader :total_amount, :remaining_amount, :category_distribution, :income

  FREQUENCY_MULTIPLIERS = {
    'daily' => 1.0 / 365,
    'weekly' => 1.0 / 52,
    'fortnightly' => 1.0 / 26,
    'monthly' => 1.0 / 12,
    'quarterly' => 1.0 / 4,
    'annually' => 1
  }.freeze

  def initialize(user, budget_frequency, annual_income = 60_000)
    @user = user
    @budget_frequency = budget_frequency
    @annual_income = annual_income
    calculate_summary
  end

  private

  def calculate_summary
    budgets = @user.budgets.order(created_at: :desc)
    @category_distribution = BudgetDistributionService.new(budgets, @budget_frequency).category_distribution
    @total_amount = @category_distribution.values.sum
    @income = @annual_income * FREQUENCY_MULTIPLIERS[@budget_frequency]
    @remaining_amount = @income - @total_amount
  end
end
