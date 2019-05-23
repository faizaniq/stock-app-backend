class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :stock_id, :stock_price, :original_quantity, :current_quantity, :purchase, :sell, :date_transaction
  belongs_to :user 
  belongs_to :stock
end

