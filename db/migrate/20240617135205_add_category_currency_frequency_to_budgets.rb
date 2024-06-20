# frozen_string_literal: true

class AddCategoryCurrencyFrequencyToBudgets < ActiveRecord::Migration[7.1]
  def change
    change_table :budgets, bulk: true do |t|
      t.string :category
      t.string :currency
      t.string :frequency
    end
  end
end
