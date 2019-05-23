class AddPurchaseToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :purchase, :boolean
  end
end
