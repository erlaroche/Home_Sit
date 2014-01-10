class CreateSitters < ActiveRecord::Migration
  def change
    create_table :sitters do |t|

      t.timestamps
    end
  end
end
