class AddSellToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :sell, :boolean
  end
end
