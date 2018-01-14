class CreateEarnings < ActiveRecord::Migration[5.1]
  def change
    create_table :earnings do |t|
      t.string :item
      t.integer :quantity
      t.integer :price
      t.integer :total
      t.string :taxclass
      t.references :ledger
      t.integer :row_order

      t.timestamps
    end
  end
end
