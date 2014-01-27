class AddBackUpSitterIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :back_up_sitter_id, :string
  end
end
