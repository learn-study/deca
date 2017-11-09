class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :namek
      t.string :address1
      t.string :address2
      t.string :tel
      t.string :sect
      t.string :kind
      t.string :text

      t.timestamps
    end
  end
end
