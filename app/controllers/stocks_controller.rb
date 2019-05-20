class StocksController < ApplicationController

  def index
    @stocks = Stock.all
    render json: @stocks
  end

  def show
    @stock = Stock.find(params[:id])
    render json: @stock
  end

  def create
    @stock = Stock.create(stock_params)
    render json: @stock
  end

  def create_stock_and_transaction
    @stock = Stock.create(stock_params)
    @transaction = Transaction.create(stock: @stock, user_id: params[:user_id])
    render json: @transaction
  end

  def update
    @stock = Stock.find(params[:id])
    render json: @stock
  end

  def delete
    @stock = Stock.find(params[:id])
    @stock.destroy
  end

  private

  def stock_params
    params.require(:stock).permit(:name, :ticker, :price, :headline, :image, :article)
  end

end
