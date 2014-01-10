class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :date
      t.string :time_start
      t.string :time_end
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
