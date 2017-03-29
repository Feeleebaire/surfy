class AddUserToOrganisations < ActiveRecord::Migration[5.0]
  def change
    add_reference :organisations, :user, foreign_key: true
  end
end
