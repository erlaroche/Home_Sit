class AddSitterRefToAppointments < ActiveRecord::Migration
  def change
    add_reference :appointments, :sitter, index: true
  end
end
