# frozen_string_literal: true

class BudgetCalculationService
  FREQUENCY_MULTIPLIERS = {
    'Daily' => 30,       # Approximate days in a month
    'Weekly' => 4.33,    # Approximate weeks in a month
    'Monthly' => 1,
    'Yearly' => 1.0 / 12 # Convert yearly to monthly
  }.freeze

  def initialize(budget)
    @budget = budget
  end

  def amount_for_view(view)
    multiplier = FREQUENCY_MULTIPLIERS[@budget.frequency] || 0
    case view
    when 'monthly'
      # Add more views if necessary
    end
    @budget.amount * multiplier
  end
end
