class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.string :class
      t.string :kind
      t.string :responsible
      t.string :deceased
      t.string :coffin
      t.text :other
      t.integer :member_id
      
      t.timestamps
    end
  end
end
