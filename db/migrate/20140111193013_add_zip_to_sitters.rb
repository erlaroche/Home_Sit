class AddZipToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :zip_code, :string
  end
end
