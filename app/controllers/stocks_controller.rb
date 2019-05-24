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

  def buytransaction
    @stock = Stock.create(stock_params)
    @transaction = Transaction.create(stock: @stock, user_id: params[:user_id], original_quantity: params[:original_quantity], current_quantity: params[:current_quantity], purchase: true, sell: false)
    render json: @transaction
  end

  def selltransaction
    @stock = Stock.create(stock_params)
    @transaction = Transaction.create(stock: @stock, user_id: params[:user_id], current_quantity: params[:current_quantity], purchase: false, sell: true)
    currentuser = User.find(params[:user_id])
    investmentarray = []
    total = 0
    sharessold = @transaction.current_quantity
    updatedfunds = (sharessold.to_f * stock_params[:price].to_f)
    currentuser.transactions.each do |t| 
      if t.stock.ticker == stock_params[:ticker] && t.purchase == true 
        total = total + t.current_quantity
      end 
      if t.stock.ticker == stock_params[:ticker] && t.purchase == true && t.current_quantity <= sharessold && sharessold > 0
        sharessold = sharessold - t.current_quantity
        t.update(current_quantity: 0)
      elsif t.stock.ticker == stock_params[:ticker] && t.purchase == true && t.current_quantity > sharessold && sharessold > 0
        t.update(current_quantity: (t.current_quantity - sharessold))
        sharessold = 0
      end 
    end 
    if total < sharessold
      render json: {error: "You Don't Have Enough Shares!"}
    else
      currentuser.update(funds: (currentuser.funds.to_f + updatedfunds))
      render json: currentuser
    end
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

