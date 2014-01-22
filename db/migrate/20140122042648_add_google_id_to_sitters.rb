class AddGoogleIdToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :google_id, :string
  end
end
