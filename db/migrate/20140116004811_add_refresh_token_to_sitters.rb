class AddRefreshTokenToSitters < ActiveRecord::Migration
  def change
    add_column :sitters, :refresh_token, :string
  end
end
