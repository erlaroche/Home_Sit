class AddProviderAndUidToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :provider, :string
    add_column :sitters, :uid, :string
  end
end
