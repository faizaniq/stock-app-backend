class WatchlistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id
end
