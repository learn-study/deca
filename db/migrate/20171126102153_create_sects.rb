class CreateSects < ActiveRecord::Migration[5.1]
  def change
    create_table :sects do |t|
      t.string :sect

      t.timestamps
    end
  end
end
