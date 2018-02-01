class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :lastname
      t.string :firstname
      t.string :name
      t.string :namekana
      t.integer :gender
      t.date :birthday
      t.string :postal
      t.string :city
      t.string :streetaddress
      t.string :tel
      t.string :mobile
      t.string :sect
      t.string :kind
      t.boolean :local, default: false, null: false
      t.boolean :reserve, default: false, null: false
      t.boolean :reserve2, default: false, null: false
      t.boolean :reserve3, default: false, null: false
      t.boolean :dm, default: false, null: false
      t.text :tag
      t.integer :row_order

      t.timestamps
    end
  end
end
