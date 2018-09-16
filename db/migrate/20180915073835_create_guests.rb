class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :firstname
      t.string :lastname
      t.string :first_furigana
      t.string :last_furigana
      t.integer :first_zip_code
      t.integer :last_zip_code
      t.string :prefectures
      t.string :municipalities

      t.timestamps
    end
  end
end
