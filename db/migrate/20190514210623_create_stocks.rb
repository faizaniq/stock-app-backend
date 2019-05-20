class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker
      t.float :price
      t.string :headline
      t.string :image
      t.string :article

      t.timestamps
    end
  end
end
