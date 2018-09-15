class AddCartIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cart_id, :integer
  end
end
