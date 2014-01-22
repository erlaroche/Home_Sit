class AddAuthCodeToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :auth_code, :string
  end
end
