class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.references :member, foreign_key: true
      t.references :member2, class_name: "Member"
      t.string :text

      t.timestamps
      t.index [:member_id, :member2_id], unique: true
    end
  end
end
