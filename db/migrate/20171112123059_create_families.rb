class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.references :member, index: true
      t.integer :separately
      t.string :relationship
      t.string :lastname
      t.string :firstname
      t.string :name
      t.string :namekana
      t.date :birthday
      t.string :postal
      t.string :city
      t.string :streetaddress
      t.text :note
      t.boolean :dm, default: false, null: false
      t.integer :row_order
      
      t.timestamps
    end
  end
end
