class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :member_id
      t.string :classification
      t.string :employee_id
      t.datetime :orderdate
      t.datetime :deliverydate
      t.datetime :payment
      t.string :name
      t.string :namekana
      t.string :firstname
      t.string :lastname
      t.string :deceased
      t.string :city
      t.string :streetaddress
      t.string :tel
      t.string :mobile
      t.integer :collection_id
      t.text :other
      
      t.timestamps
    end
  end
end
