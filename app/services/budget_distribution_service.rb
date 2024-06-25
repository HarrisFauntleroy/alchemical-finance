# frozen_string_literal: true

# Service to calculate budget distribution across categories for a user
class BudgetDistributionService
  def initialize(budgets, budget_frequency)
    @budgets = budgets
    @budget_frequency = budget_frequency
  end

  def category_distribution
    @budgets.each_with_object(Hash.new(0)) do |budget, hash|
      amount = BudgetCalculationService.new(budget).amount_for_budget_frequency(@budget_frequency)
      hash[budget.category] += amount
    end.transform_values(&:to_f)
  end
end
