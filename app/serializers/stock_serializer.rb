class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :ticker, :price
end
