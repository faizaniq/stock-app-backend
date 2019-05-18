class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id
  belongs_to :user 
  belongs_to :stock
end
