class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.string :home
      t.string :classification
      t.string :kind
      t.string :responsible
      t.string :deceased
      t.date :coffin
      t.text :other
      t.integer :member_id
      
      t.timestamps
    end
  end
end
