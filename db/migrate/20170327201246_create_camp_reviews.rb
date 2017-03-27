class CreateCampReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :camp_reviews do |t|
      t.integer :rate
      t.string :title
      t.text :comment
      t.references :camp, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
