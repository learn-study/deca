class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.integer :member_id
      t.string :classification
      t.string :lastname
      t.string :firstname
      t.string :name
      t.string :namekana
      t.string :city
      t.string :streetadress
      t.string :relation
      t.string :hospital
      t.string :ceremonial1
      t.string :ceremonial2
      t.string :ceremonial3
      t.string :plan
      t.string :lower
      t.string :other

      t.timestamps
    end
  end
end
