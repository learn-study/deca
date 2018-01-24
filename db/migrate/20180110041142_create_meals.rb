class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.references :enforcement, foreign_key: true
      t.string :item
      t.integer :number
      t.integer :price

      t.timestamps
    end
  end
end
