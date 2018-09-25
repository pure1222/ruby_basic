class ChangePhoneNumberToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :phone_number, :string
    remove_column :guests, :phone_number, :integer
  end
end
