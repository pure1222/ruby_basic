class AddRequestToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :request_food, :string
  end
end
