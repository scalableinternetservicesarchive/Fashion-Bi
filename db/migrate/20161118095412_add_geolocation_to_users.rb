class AddGeolocationToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :city, :string
  end
end
