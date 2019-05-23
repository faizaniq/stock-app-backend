class AddOriginalFundsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :original_funds, :float
  end
end
