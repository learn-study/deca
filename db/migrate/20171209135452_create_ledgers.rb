class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.string :classification
      t.integer :kind_id
      t.string :employee_id
      t.string :deceased
      t.date :coffin
      t.text :other
      t.integer :member_id
      
      t.timestamps
    end
  end
end
