class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :sell
      t.float :cost

      t.timestamps
    end
  end
end
