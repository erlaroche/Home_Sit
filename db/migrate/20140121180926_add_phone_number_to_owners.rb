class AddPhoneNumberToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :phone_number, :string
  end
end
