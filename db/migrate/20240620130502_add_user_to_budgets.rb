# frozen_string_literal: true

class AddUserToBudgets < ActiveRecord::Migration[7.1]
  def change
    add_reference :budgets, :user, null: false, foreign_key: true, default: 0
  end
end
