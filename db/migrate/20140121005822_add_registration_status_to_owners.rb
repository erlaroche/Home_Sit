class AddRegistrationStatusToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :registered, :boolean
  end
end
