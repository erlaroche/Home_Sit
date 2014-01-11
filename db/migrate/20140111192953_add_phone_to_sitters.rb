class AddPhoneToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :phone_number, :string
  end
end
