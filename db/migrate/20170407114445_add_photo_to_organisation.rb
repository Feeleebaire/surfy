class AddPhotoToOrganisation < ActiveRecord::Migration[5.0]
  def change
    add_column :organisations, :photo, :string
  end
end
