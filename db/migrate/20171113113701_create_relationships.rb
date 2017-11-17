class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :user, class_name: "Member", foreign_key: true
      t.references :member, foreign_key: true
      t.string :text
      t.integer :row_order

      t.timestamps
    end
  end
end
