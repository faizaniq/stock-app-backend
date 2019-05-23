class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end

  def create
    @transaction = Transaction.create(transaction_params)
    render json: @transaction
  end

  def update
    @transaction = Transaction.find(params[:id])
    @transaction.update(current_quantity: params[:quantity])
    render json: @transaction
  end

  def delete
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
  end

  private

  def transaction_params
    params.require(:transaction).permit(:user_id, :stock_id, :stock_price, :current_quantity, :original_quantity, :date_transaction, :purchase, :sell)
  end


end
