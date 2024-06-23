# frozen_string_literal: true

class CreateBudgets < ActiveRecord::Migration[7.1]
  def change
    create_table :budgets do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2

      t.date :start_date
      t.date :end_date

      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
