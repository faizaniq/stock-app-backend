class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :quantity, :original_quantity
  end
end
