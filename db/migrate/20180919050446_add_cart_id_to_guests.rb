class AddCartIdToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :cart_id, :integer
  end
end
