class CreateDeliverables < ActiveRecord::Migration[5.1]
  def change
    create_table :deliverables do |t|
      t.integer :supplier_id
      t.references :report, foreign_key: true
      t.integer :item_id
      t.integer :quantity
      t.integer :price
      t.integer :amount
      t.integer :taxation_id
      t.integer :cost
      t.integer :total_cost
      t.integer :cost_taxation_id
      t.boolean :ordering
      t.datetime :derivery_date
      t.integer :method_id

      t.timestamps
    end
  end
end
