# frozen_string_literal: true

class BudgetsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_budget, only: %i[show edit update destroy]

  def index
    @budget_frequency = params[:budget_frequency] || 'annually'
    @pagy, budgets = pagy(current_user.budgets.order(created_at: :desc))
    @presenter = BudgetIndexPresenter.new(current_user, @budget_frequency, budgets, @pagy)

    respond_to do |format|
      format.html
    end
  end

  def show; end

  def new
    @budget = current_user.budgets.new(user: current_user)
  end

  def edit; end

  def create
    @budget = current_user.budgets.new(budget_params)

    if @budget.save
      redirect_to budgets_path, notice: I18n.t('flash.budgets.create.success')
    else
      flash[:error] = I18n.t('flash.budgets.create.failure')
      render :new
    end
  end

  def update
    if @budget.update(budget_params)
      redirect_to budgets_path, notice: I18n.t('flash.budgets.update.success')
    else
      flash[:error] = I18n.t('flash.budgets.update.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @budget.destroy
      redirect_to budgets_path, notice: I18n.t('flash.budgets.destroy.success')
    else
      flash[:error] = I18n.t('flash.budgets.destroy.failure')
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_budget
    @budget = Budget.find(params[:id])
  end

  def budget_params
    params.require(:budget).permit(:name, :amount, :category, :currency, :frequency)
  end
end
