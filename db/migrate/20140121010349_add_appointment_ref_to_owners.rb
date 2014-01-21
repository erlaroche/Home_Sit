class AddAppointmentRefToOwners < ActiveRecord::Migration
  def change
    add_reference :owners, :appointment, index: true
  end
end
