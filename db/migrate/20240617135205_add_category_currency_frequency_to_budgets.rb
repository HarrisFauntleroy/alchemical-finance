# frozen_string_literal: true

class AddCategoryCurrencyFrequencyToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_column :budgets, :category, :string
    add_column :budgets, :currency, :string
    add_column :budgets, :frequency, :string
  end
end
