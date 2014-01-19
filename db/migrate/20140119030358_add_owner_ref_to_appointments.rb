class AddOwnerRefToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :owner, index: true
  end
end
