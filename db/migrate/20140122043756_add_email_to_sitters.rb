class AddEmailToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :email, :string
  end
end
