class CreateRemarks < ActiveRecord::Migration[5.1]
  def change
    create_table :remarks do |t|
      t.date :date
      t.text :content
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
