class CreateAltars < ActiveRecord::Migration[5.1]
  def change
    create_table :altars do |t|
      t.integer :member_id
      t.string :applicantlastname
      t.string :applicantfirstname
      t.string :applicantkana
      t.string :classification
      t.string :employee_id
      t.datetime :orderdate
      t.string :deceased
      t.string :city
      t.string :streetaddress
      #無くなった日
      t.datetime :ddate
      #戒名
      t.string :pardon
      #俗名
      t.string :popular
      #行年
      t.string :line
      #寺院
      t.string :tenple_id
      #宗派
      t.string :sect_id
     
      t.string :tel
      t.string :mobile
      t.integer :collection_id
      t.text :other

      t.timestamps
    end
  end
end
