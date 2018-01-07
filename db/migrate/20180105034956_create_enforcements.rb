class CreateEnforcements < ActiveRecord::Migration[5.1]
  def change
    create_table :enforcements do |t|
      t.string :family_name
      t.integer :member_id
      t.string :classification
      t.integer :kind_id
      t.integer :employee_id
      t.string :deceased
      t.datetime :birthday
      t.datetime :ddate
      t.string :cliefmaster
      t.string :relationship
      t.string :constructor
      t.string :city
      t.string :streetaddress
      t.string :tel
      t.string :mobile
      t.string :plan
      t.integer :plan
      t.integer :total
      t.datetime :wake
      t.datetime :funeral
      t.datetime :coffin
      t.string :ceremonial_id
      t.integer :royarity
      t.integer :burdon
      t.string :ucosts
      t.integer :temple_id
      t.integer :number_of_pepole
      #礼状
      t.integer :letter_price
      t.integer :letter_quantity
      t.integer :letter_supplier_id
      #香典返し
      t.integer :refreshment_price
      t.integer :refreshment_quantity
      t.integer :refreshment_supplier_id     
      t.integer :refreshment_product_id     
      #引き出物
      t.integer :gift_price
      t.integer :gift_quantity
      t.integer :gift_supplier_id     
      t.integer :gift_product_id       
      #夜具
      t.integer :nightwear_price
      t.integer :nightwear_quantity
      t.integer :nightwear_supplier_id
      #bus
      t.integer :bus_price
      t.integer :bus_quantity
      t.integer :bus_supplier_id

      t.string :r_bus
      t.text :other
      
      t.timestamps
    end
  end
end
