class AddNameToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :name, :string
  end
end
