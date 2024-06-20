# frozen_string_literal: true

class BudgetsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_budget, only: %i[show edit update destroy]

  def index
    @budget = Budget.new
    @pagy, @budgets = pagy(Budget.order(created_at: :desc))
    respond_to do |format|
      format.html
    end
  end

  def show; end

  def new
    @budget = Budget.new(user: current_user)
  end

  def edit; end

  def create
    @budget = current_user.budgets.new(budget_params)
    if @budget.save
      redirect_to budgets_path, notice: 'Budget was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @budget.update(budget_params)
      redirect_to budgets_path, notice: 'Budget was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
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
    params.require(:budget).permit(:name, :amount, :category, :currency, :frequency)
  end
end
