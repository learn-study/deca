class CreateDeliverymethods < ActiveRecord::Migration[5.1]
  def change
    create_table :deliverymethods do |t|
      t.string :text

      t.timestamps
    end
  end
end
