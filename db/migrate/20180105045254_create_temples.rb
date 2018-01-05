class CreateTemples < ActiveRecord::Migration[5.1]
  def change
    create_table :temples do |t|
      t.string :name
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
