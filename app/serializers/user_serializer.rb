class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :watchlists, :funds, :investments


  def watchlists
    self.object.watchlists.map do |a|
      { 
        company: a.stock.name,
        ticker: a.stock.ticker,
        price: a.stock.price
      }
    end 
  end 

  def investments 
    self.object.transactions.map do |s| 
      {
        company: s.stock.name,
        ticker: s.stock.ticker,
        price: s.stock.price
      }
    end 
  end 
end
