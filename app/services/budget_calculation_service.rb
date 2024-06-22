# frozen_string_literal: true

class BudgetCalculationService
  FREQUENCY_MULTIPLIERS = {
    'Daily' => { 'daily' => 1, 'weekly' => 7, 'fortnightly' => 14, 'monthly' => 30, 'quarterly' => 90,
                 'annually' => 365 },
    'Weekly' => { 'daily' => 1.0 / 7, 'weekly' => 1, 'fortnightly' => 2, 'monthly' => 4, 'quarterly' => 12,
                  'annually' => 52 },
    'Fortnightly' => { 'daily' => 1.0 / 14, 'weekly' => 0.5, 'fortnightly' => 1, 'monthly' => 2, 'quarterly' => 6,
                       'annually' => 26 },
    'Monthly' => { 'daily' => 1.0 / 30, 'weekly' => 1.0 / 4, 'fortnightly' => 0.5, 'monthly' => 1, 'quarterly' => 3,
                   'annually' => 12 },
    'Quarterly' => { 'daily' => 1.0 / 90, 'weekly' => 1.0 / 12, 'fortnightly' => 1.0 / 6, 'monthly' => 1.0 / 3,
                     'quarterly' => 1, 'annually' => 4 },
    'Annually' => { 'daily' => 1.0 / 365, 'weekly' => 1.0 / 52, 'fortnightly' => 1.0 / 26, 'monthly' => 1.0 / 12,
                    'quarterly' => 1.0 / 4, 'annually' => 1 }
  }.freeze

  def initialize(budget)
    @budget = budget
  end

  def amount_for_view(view)
    multiplier = FREQUENCY_MULTIPLIERS[@budget.frequency][view] || 0
    @budget.amount * multiplier
  end
end
