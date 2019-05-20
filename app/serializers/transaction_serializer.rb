class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id, :stock_price, :quantity, :date_transaction
  belongs_to :user 
  belongs_to :stock
end

