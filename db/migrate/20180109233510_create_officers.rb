class CreateOfficers < ActiveRecord::Migration[5.1]
  def change
    create_table :officers do |t|
      t.references :supplier, foreign_key: true
      t.references :enforcement, foreign_key: true
      t.integer :receptionist
      t.integer :accounting
      t.integer :reception
      t.integer :moderator
      t.integer :parking
      t.integer :other

      t.timestamps
    end
  end
end
