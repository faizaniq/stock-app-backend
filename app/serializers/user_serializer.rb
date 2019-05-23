class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :watchlists, :funds, :original_funds, :investments


  def watchlists
    self.object.watchlists.map do |a|
      { 
        stock_id: a.stock.id,
        company: a.stock.name,
        ticker: a.stock.ticker,
        price: a.stock.price
      }
    end 
  end 

  def investments 
    self.object.transactions.map do |s| 
      {
        transaction_id: s.id,
        stock_id: s.stock.id,
        company: s.stock.name,
        ticker: s.stock.ticker,
        price: s.stock.price,
        current_quantity: s.current_quantity,
        original_quantity: s.original_quantity,
        purchase: s.purchase,
        sell: s.sell
      }
    end 
  end 
end
