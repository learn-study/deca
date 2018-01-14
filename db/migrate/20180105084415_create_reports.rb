class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :member_id
      t.string :applicantlastname
      t.string :applicantfirstname
      t.string :applicantkana
      t.string :classification
      t.string :employee_id
      t.datetime :orderdate
      t.datetime :deliverydate
      t.datetime :payment
      t.string :deceased
      t.string :city
      t.string :streetaddress
      t.string :tel
      t.string :mobile
      t.integer :collection_id
      t.integer :total_fee #合計金額
      t.integer :total_cost #原価
      t.text :other
      
      t.timestamps
    end
  end
end
