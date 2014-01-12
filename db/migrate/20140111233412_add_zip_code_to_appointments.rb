class AddZipCodeToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :zip_code, :string
  end
end
