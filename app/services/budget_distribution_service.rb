# frozen_string_literal: true

class BudgetDistributionService
  def initialize(budgets, view)
    @budgets = budgets
    @view = view
  end

  def category_distribution
    @budgets.each_with_object(Hash.new(0)) do |budget, hash|
      amount = BudgetCalculationService.new(budget).amount_for_view(@view)
      hash[budget.category] += amount
    end.transform_values(&:to_f)
  end
end
