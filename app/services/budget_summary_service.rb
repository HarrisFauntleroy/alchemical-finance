# frozen_string_literal: true

class BudgetSummaryService
  attr_reader :total_amount, :remaining_amount, :category_distribution, :income

  INCOME_ANNUAL = 60_000 # Example annual income. Replace with actual value or fetch from user.

  FREQUENCY_MULTIPLIERS = {
    'daily' => 1.0 / 365,
    'weekly' => 1.0 / 52,
    'fortnightly' => 1.0 / 26,
    'monthly' => 1.0 / 12,
    'quarterly' => 1.0 / 4,
    'annually' => 1
  }.freeze

  def initialize(user, budget_frequency)
    @user = user
    @budget_frequency = budget_frequency
    calculate_summary
  end

  private

  def calculate_summary
    budgets = @user.budgets.order(created_at: :desc)
    @category_distribution = BudgetDistributionService.new(budgets, @budget_frequency).category_distribution
    @total_amount = @category_distribution.values.sum
    @income = INCOME_ANNUAL * FREQUENCY_MULTIPLIERS[@budget_frequency]
    @remaining_amount = @income - @total_amount
  end
end
