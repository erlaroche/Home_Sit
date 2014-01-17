class AddPictureToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :picture, :string
  end
end
