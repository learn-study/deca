class CreateBuddhistmemorials < ActiveRecord::Migration[5.1]
  def change
    create_table :buddhistmemorials do |t|
      t.string :name

      t.timestamps
    end
  end
end
