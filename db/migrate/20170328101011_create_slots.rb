class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.integer :price
      t.integer :nbr_surfers
      t.date :start_date
      t.date :end_date
      t.references :camp, foreign_key: true

      t.timestamps
    end
  end
end
