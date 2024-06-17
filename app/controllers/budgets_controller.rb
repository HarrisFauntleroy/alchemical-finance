# frozen_string_literal: true

class BudgetsController < ApplicationController
  before_action :set_budget, only: %i[show edit update destroy]

  def index
    @budget = Budget.new # Temporary
    @budgets = Budget.all
  end

  def show; end

  def new
    @budget = Budget.new
  end

  def edit; end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to budgets_path, notice: 'Budget was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @budget.update(budget_params)
      redirect_to budgets_path, notice: 'Budget was successfully updated.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @budget.destroy
    redirect_to budgets_path, notice: 'Budget was successfully destroyed.'
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:name, :amount)
  end
end
