class AddAttachmentToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :attachment, :string
  end
end
