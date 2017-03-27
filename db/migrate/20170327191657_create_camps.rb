class CreateCamps < ActiveRecord::Migration[5.0]
  def change
    create_table :camps do |t|
      t.string :title
      t.text :description
      t.string :language
      t.string :address
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
