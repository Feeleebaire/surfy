class CreateCampBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :camp_bookings do |t|
      t.integer :nbr_surfers
      t.references :slot, foreign_key: true
      t.references :camp, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
