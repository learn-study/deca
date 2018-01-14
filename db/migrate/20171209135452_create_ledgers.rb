class CreateLedgers < ActiveRecord::Migration[5.1]
  def change
    create_table :ledgers do |t|
      t.string :applicantlastname
      t.string :applicantfirstname
      t.string :applicantkana
      t.string :applicantname
      t.string :classification
      t.integer :kind_id
      t.string :employee_id
      t.string :deceased
      t.date :coffin
      t.text :other
      t.integer :member_id
      t.integer :total_cost
      t.integer :total_amount
      
      t.timestamps
    end
  end
end
