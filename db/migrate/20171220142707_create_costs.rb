class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.string :item
      t.integer :quantity
      t.integer :price
      t.integer :total
      t.string :supplier
      t.references :ledger
      t.integer :row_order

      t.timestamps
    end
  end
end
