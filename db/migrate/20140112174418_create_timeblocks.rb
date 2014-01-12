class CreateTimeblocks < ActiveRecord::Migration
  def change
    create_table :timeblocks do |t|
      t.string :name
      t.string :time_start
      t.string :time_end

      t.timestamps
    end
  end
end
