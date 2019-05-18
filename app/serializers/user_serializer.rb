class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :watchlists


  def watchlists
    self.object.watchlists.map do |a|
      { 
        company: a.stock.name,
        ticker: a.stock.ticker,
        price: a.stock.price
      }
    end 
  end 


end
