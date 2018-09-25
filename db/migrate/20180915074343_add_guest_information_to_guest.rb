class AddGuestInformationToGuest < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :address, :string
    add_column :guests, :phone_number, :string
    add_column :guests, :email, :string
  end
end
