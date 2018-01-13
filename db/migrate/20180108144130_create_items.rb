class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :supplier
      t.integer :item_id
      t.string :name
      t.integer :sell
      t.integer :cost

      t.timestamps
    end
  end
end
