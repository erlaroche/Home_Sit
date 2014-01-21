class AddLinkedInToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :linked_in, :string
  end
end
